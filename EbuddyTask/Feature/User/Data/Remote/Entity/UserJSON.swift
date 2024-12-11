//
//  UserJSON.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

struct UserJSON: Codable {
    var uid:String?
    var email:String?
    var phoneNumber:String?
    var gender:GenderEnum?
    
    private enum CodingKeys: String, CodingKey {
        case uid,email,phoneNumber
        case gender = "ge"
    }
}

enum GenderEnum: Int, Codable {
    case female = 0
    case male = 1
}
