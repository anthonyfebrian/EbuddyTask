//
//  UserRemoteDataSource.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

protocol UserRemoteDataSource {
    func getUsers() async -> Resource<[UserJSON]>
}
