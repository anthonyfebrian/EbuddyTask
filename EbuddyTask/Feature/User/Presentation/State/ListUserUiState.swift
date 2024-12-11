//
//  ListUserUiState.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

enum ListUserUiState {
    case loading
    case success([User])
    case failed(String)
}
