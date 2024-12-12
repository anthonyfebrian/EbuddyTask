//
//  UserRepositoryImpl.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Combine
import Foundation

class UserRepositoryImpl: UserRepository {
    private let remoteDataSource:UserRemoteDataSource
    
    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getUsers() -> AnyPublisher<Result<[User]>, Never> {
        let subject = PassthroughSubject<Result<[User]>, Never>()
        
        Task {
            let resource = await remoteDataSource.getUsers(filter: [], order: [])
            switch resource {
            case .success(let usersJson):
                subject.send(.success(
                    usersJson
                        .filter({$0.uid != nil})
                        .map { $0.toDomain() }
                ))
            case .failed(let message):
                subject.send(.failed(message))
            }
        }
        
        return subject.eraseToAnyPublisher()
    }
    
    func fetchRecentlyActiveFemaleUsersWithHighestRatingAndLowestPrice() -> AnyPublisher<Result<[User]>, Never> {
        let subject = PassthroughSubject<Result<[User]>, Never>()
        
        Task {
            let filter = [
                Filter(field: "ge", value: GenderEnum.female.rawValue)
            ]
            let order = [
                Order(field: "active", descending: true),
                Order(field: "rating", descending: true),
                Order(field: "price", descending: false)
            ]
            
            let resource = await remoteDataSource.getUsers(filter: filter, order: order)
            switch resource {
            case .success(let usersJson):
                subject.send(.success(
                    usersJson
                        .filter({$0.uid != nil})
                        .map { $0.toDomain() }
                ))
            case .failed(let message):
                subject.send(.failed(message))
            }
        }
        
        return subject.eraseToAnyPublisher()
    }
    
    func getRealtimeUsers() -> AnyPublisher<[User], Never> {
        let temp = remoteDataSource
            .getRealtimeUsers()
            .map {
                $0.filter({$0.uid != nil})
                    .map {
                        $0.toDomain()
                    }
            }
            .eraseToAnyPublisher()
        
        
        return temp
    }
}
