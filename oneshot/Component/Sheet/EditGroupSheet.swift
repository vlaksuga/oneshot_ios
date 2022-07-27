//
//  EditGroupSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/25.
//

import SwiftUI

struct EditGroupSheet: View {
    
    var group: AccountGroup
    
    var body: some View {
        Text(group.myAccountGroupName)
    }
}

struct EditGroupSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditGroupSheet(group: AccountGroup())
    }
}
