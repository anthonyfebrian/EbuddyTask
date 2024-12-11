//
//  ListUserScreen.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Factory
import SwiftUI

struct ListUserScreen: View {
    @StateObject private var vm:ListUserViewModel = Container.shared.listUserViewModel()
    
    var body: some View {
        ListUserContent(uiState: vm.uiState)
            .onAppear {
                vm.getUser()
            }
    }
}

private struct ListUserContent:View {
    private let uiState:ListUserUiState
    init(uiState: ListUserUiState) {
        self.uiState = uiState
    }
    var body: some View {
        switch uiState {
        case .loading:
            ProgressView()
        case .success(let users):
            List(users) {
                UserView(user: $0)
            }
        case .failed(let message):
            Text(message)
                .foregroundColor(Color.red)
        }
    }
}

#Preview("Loading") {
    ListUserContent(uiState: .loading)
}

#Preview("Success") {
    ListUserContent(uiState: .success([]))
}

#Preview("Failed") {
    ListUserContent(uiState: .failed("Failed"))
}
