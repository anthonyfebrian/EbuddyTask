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
            let resource = await remoteDataSource.getUsers()
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
