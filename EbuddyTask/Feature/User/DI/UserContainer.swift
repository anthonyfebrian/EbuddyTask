//
//  UserContainer.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Factory
import Foundation

extension Container {
    var remoteDataSource: Factory<UserRemoteDataSource> {
        Factory(self) { UserRemoteDataSourceImpl() }
    }
    
    var repository: Factory<UserRepository> {
        Factory(self) { UserRepositoryImpl(remoteDataSource: self.remoteDataSource()) }
    }
    
    var listUserViewModel: Factory<ListUserViewModel> {
        Factory(self) { ListUserViewModel(repository: self.repository()) }
    }
}
