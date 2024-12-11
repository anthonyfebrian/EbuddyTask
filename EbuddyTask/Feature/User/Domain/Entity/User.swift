//
//  User.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

struct User: Identifiable, Hashable {
    var id:String
    var email:String?
    var phoneNumber:String?
    var gender:Gender
}
