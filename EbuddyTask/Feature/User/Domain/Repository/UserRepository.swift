//
//  UserRepository.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Combine
import Foundation

protocol UserRepository {
    func getUsers() -> AnyPublisher<Result<[User]>, Never>
    
    func fetchRecentlyActiveFemaleUsersWithHighestRatingAndLowestPrice() -> AnyPublisher<Result<[User]>, Never>
    
    func getRealtimeUsers() -> AnyPublisher<[User], Never>
}
