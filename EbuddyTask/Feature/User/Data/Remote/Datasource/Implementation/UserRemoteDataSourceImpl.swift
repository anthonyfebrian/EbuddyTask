//
//  UserRemoteDataSourceImpl.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Combine
import FirebaseFirestore
import Foundation
import FirebaseStorage

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
    
    func getRealtimeUsers() -> AnyPublisher<[UserJSON], Never> {
        let subject = PassthroughSubject<[UserJSON], Never>()
        
        db.collection(COLLECTION_NAME)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                
                do {
                    let usersJson = try document.documents
                        .map {
                            try $0.data(as: UserJSON.self)
                        }
                    subject.send(usersJson)
                } catch {
                    print("Error getting getRealtimeUsers: \(error)")
                }
            }
        
        return subject.eraseToAnyPublisher()
    }
    
    func uploadPhoto(uid:String, url: URL) async -> Resource<Void> {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let userRef = storageRef.child("USERS/\(uid).jpg")
        
        do {
            let _ = try await userRef.putFileAsync(from: url)
            return .success(())
        } catch {
            print("Error getting uploadPhoto: \(error)")
            return .failed(error.localizedDescription)
        }
    }
}
