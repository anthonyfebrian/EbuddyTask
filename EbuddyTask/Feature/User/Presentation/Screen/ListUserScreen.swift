//
//  ListUserScreen.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Factory
import SwiftUI

struct ListUserScreen: View {
    @EnvironmentObject private var userObs:UserObs
    
    var body: some View {
        ListUserContent(users: userObs.users)
    }
}

private struct ListUserContent:View {
    private let users:[User]
    
    init(users:[User]) {
        self.users = users
    }
    var body: some View {
        List(users) {
            UserView(user: $0)
        }
    }
}


#Preview("Success") {
    ListUserContent(users: [User(id: "UID", email: "Email", phoneNumber: "08123456789", gender: .male)])
}
