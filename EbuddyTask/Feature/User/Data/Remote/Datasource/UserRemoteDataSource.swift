//
//  UserRemoteDataSource.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Combine
import Foundation

protocol UserRemoteDataSource {
    func getUsers(filter:[Filter], order:[Order]) async -> Resource<[UserJSON]>
    
    func getRealtimeUsers() -> AnyPublisher<[UserJSON], Never>
    
    func uploadPhoto(uid:String, url: URL) async -> Resource<Void>
}
