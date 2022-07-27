//
//  SelectAccountSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/25.
//

import SwiftUI

struct SelectAccountSheet: View {
    
    var accounts:[Account]
    
    var body: some View {
        VStack {
            List(accounts) { account in
                AccountItem(account: account)
            }
        }
    }
}

struct SelectAccountSheet_Previews: PreviewProvider {
    static var previews: some View {
        SelectAccountSheet(accounts: [Account()])
    }
}
