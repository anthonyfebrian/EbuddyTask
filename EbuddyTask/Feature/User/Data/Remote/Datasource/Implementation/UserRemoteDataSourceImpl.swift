//
//  UserRemoteDataSourceImpl.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import FirebaseFirestore
import Foundation

class UserRemoteDataSourceImpl: UserRemoteDataSource {
    private let COLLECTION_NAME = "USERS"
    private let db = Firestore.firestore()
    
    func getUsers() async -> Resource<[UserJSON]> {
        do {
            let usersJson = try await db.collection(COLLECTION_NAME)
                .getDocuments()
                .documents
                .map {
                    try $0.data(as: UserJSON.self)
                }
            
            return .success(usersJson)
        } catch {
            print("Error getting getUsers: \(error)")
            return .failed(error.localizedDescription)
        }
    }
}
