//
//  AccountItem.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/25.
//

import SwiftUI

struct AccountItem: View {
    
    var account: Account
    
    var body: some View {
        HStack{
            Text(account.accountName)
            Spacer()
        }
        .padding()
        .font(.system(size: 14))
    }
}

struct AccountItem_Previews: PreviewProvider {
    static var previews: some View {
        AccountItem(account: Account())
    }
}
