//
//  UserObs.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import Combine
import Factory
import Foundation
import SwiftUI

class UserObs: ObservableObject {
    @Published var users:[User] = []
    
    private let repository:UserRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: UserRepository = Container.shared.repository()) {
        self.repository = repository
        
        self.repository.getRealtimeUsers()
            .sink {
                self.users = $0
            }
            .store(in: &cancellables)
    }
    
}
