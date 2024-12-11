//
//  ListUserViewModel.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Combine
import Factory
import Foundation
import SwiftUI

class ListUserViewModel: ObservableObject {
    @Published var uiState = ListUserUiState.loading
    private let repository:UserRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: UserRepository = Container.shared.repository()) {
        self.repository = repository
    }
    
    func getUser() {
        repository.getUsers()
            .sink { result in
                DispatchQueue.main.async {
                    switch result {
                    case .loading:
                        self.uiState = .loading
                    case .success(let users):
                        self.uiState = .success(users)
                    case .failed(let message):
                        self.uiState = .failed(message)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
