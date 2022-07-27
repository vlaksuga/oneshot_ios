//
//  StoreItem.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import SwiftUI

struct StoreItem: View {
    
    var store: Store
    
    var body: some View {
        HStack{
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
            VStack(alignment: .leading, spacing: 5) {
                Text(store.storeName)
            }
            .font(.system(size: 14))
            .padding()
            Spacer()
        }
    }
}

struct StoreItem_Previews: PreviewProvider {
    static var previews: some View {
        StoreItem(store: Store())
    }
}
