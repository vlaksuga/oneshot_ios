//
//  SelectStoreSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import SwiftUI

struct SelectStoreSheet: View {
    
    var stores: [Store]
    
    var body: some View {
        VStack {
            Text("Stores")
            List(stores) { store in
                StoreItem(store: store)
                
            }
            .listStyle(.plain)
        }
    }
}

struct SelectStoreSheet_Previews: PreviewProvider {
    static var previews: some View {
        SelectStoreSheet(stores: [Store(), Store(), Store()])
    }
}
