//
//  UserView.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import SwiftUI

struct UserView: View {
    private let user:User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            Text(user.id)
            Text("Email : \(user.email ?? "-")")
            Text("Phone : \(user.phoneNumber ?? "-")")
            Text("Gender : \(user.gender)")
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .border(Color("Border"))
        .padding()
    }
}

#Preview {
    UserView(user: User(id: "UID", email: "Email", phoneNumber: "08123456789", gender: .male))
}
