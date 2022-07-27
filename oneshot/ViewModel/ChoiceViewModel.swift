//
//  ChoiceViewModel.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import Firebase


class ChoiceViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    let formatter = ModelFormatter()
    
    @Published var currentChoices : [Choice] = []
    
    func attachCurrentChoices(storeId sid : String, accountId aid : String, orderId oid : String) {
        self.db.collection("stores/\(sid)/orders/\(oid)/choices")
            .whereField("choiceAccountId", isEqualTo: aid)
            .addSnapshotListener { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.currentChoices = snapshot.documents.map({ doc in
                        return self.formatter.toChoice(document: doc)
                    })
                }
            } else {
                print(error.debugDescription)
            }
        }
    }
}
