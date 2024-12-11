//
//  UserMapper.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

extension UserJSON {
    func toDomain() -> User {
        var gender:Gender = .female
        switch self.gender {
        case .some(.male):
            gender = .male
        case .some(.female):
            gender = .female
        case .none:
            print("Do nothing")
        }
        
        return User(
            id: self.uid!,
            email: self.email,
            phoneNumber: self.phoneNumber,
            gender: gender
        )
    }
}
