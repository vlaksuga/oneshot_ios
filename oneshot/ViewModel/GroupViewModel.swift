//
//  GroupViewModel.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import Firebase

class GroupViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    let formatter = ModelFormatter()
    
    @Published var currentGroups : [AccountGroup] = []
    
    func attachCurrentGroups(accountId aid : String) {
        self.db.collection("accounts/\(aid)/myAccountGroups")
            .whereField("isAvailable", isEqualTo: true)
            .addSnapshotListener { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.currentGroups = snapshot.documents.map({ doc in
                        return self.formatter.toAccountGroup(document: doc)
                    })
                }
            } else {
                print(error.debugDescription)
            }
        }
    }
}
