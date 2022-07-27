//
//  RequestViewModel.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import Firebase


class RequestViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    let formatter = ModelFormatter()
    
    
    @Published var ownerRequests : [ChoiceRequest] = []
    @Published var currentRequests : [ChoiceRequest] = []
    
    func attachRequests(accountId aid: String) {
        attachOwnerRequests(accountId: aid)
        attachCurrentRequests(accountId: aid)
    }
    
    func attachOwnerRequests(accountId aid : String) {
        self.db.collection("accounts/\(aid)/choiceRequests")
            .whereField("createUserId", isEqualTo: aid)
            .addSnapshotListener { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.ownerRequests = snapshot.documents.map({ doc in
                        return self.formatter.toChoiceRequest(document: doc)
                    })
                }
            } else {
                print(error.debugDescription)
            }
        }
    }
    
    func attachCurrentRequests(accountId aid : String) {
        self.db.collection("accounts/\(aid)/choiceRequests")
            .whereField("isOpen", isEqualTo: true)
            .addSnapshotListener { snapshot, error in
                if error == nil {
                    if let snapshot = snapshot {
                        self.currentRequests = snapshot.documents.map({ doc in
                            return self.formatter.toChoiceRequest(document: doc)
                        })
                        print("xx : requests == \(self.currentRequests)")
                    }
                } else {
                    print(error.debugDescription)
                }
            }
    }
    
}
