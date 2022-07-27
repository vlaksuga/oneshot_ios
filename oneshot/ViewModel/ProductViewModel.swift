//
//  ProductViewModel.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import Firebase

class ProductViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    let formatter = ModelFormatter()
    
    @Published var currentProducts : [Product] = []
    
    func attachCurrentProducts(storeId sid : String) {
        self.db.collection("stores/\(sid)/products")
            .addSnapshotListener { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.currentProducts = snapshot.documents.map({ doc in
                        return self.formatter.toProduct(document: doc)
                    })
                }
            } else {
                print(error.debugDescription)
            }
        }
    }
}
