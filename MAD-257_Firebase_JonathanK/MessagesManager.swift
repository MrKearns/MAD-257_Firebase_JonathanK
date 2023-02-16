//
//  MessagesManager.swift
//  MAD-257_Firebase_JonathanK
//
//  Created by Jonathan Kearns on 2/13/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class MessagesManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var lastMessageId = ""
    
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents
            else{
                print("error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                } catch {
                    print ("error: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String){
        do{
            let newMesssage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMesssage)
            
        } catch {
            print(error)
        }
        
    }
    
    
}
