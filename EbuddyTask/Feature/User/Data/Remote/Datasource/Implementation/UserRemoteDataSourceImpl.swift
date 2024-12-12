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
    
    func getUsers(filter:[Filter], order:[Order]) async -> Resource<[UserJSON]> {
        do {
            var query:Query = db.collection(COLLECTION_NAME)
            
            print("Filter : \(filter)")
            print("Order : \(order)")
            
            filter.forEach {
                query = query.whereField($0.field, isEqualTo: $0.value)
            }
            
            order.forEach {
                query = query.order(by: $0.field, descending: $0.descending)
            }
            
            let usersJson = try await query
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
    
    func getGetActiveFemaleUsers() async -> Resource<[UserJSON]> {
        do {
            let query = db.collection(COLLECTION_NAME)
                .whereField("ge", isEqualTo: GenderEnum.female)
                .order(by: "active", descending: true)
                .order(by: "rating", descending: true)
                .order(by: "price", descending: false)
            
            
            
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
