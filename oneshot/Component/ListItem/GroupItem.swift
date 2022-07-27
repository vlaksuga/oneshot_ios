//
//  GroupItem.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct GroupItem : View {
    
    var group : AccountGroup
    
    var body: some View {
        HStack {
            Text(group.myAccountGroupName)
            Spacer()
            Text(String(group.myAccountGroupSize) + "명")
        }
        
    }
}

struct GroupItem_Previews: PreviewProvider {
    static var previews: some View {
        GroupItem(group: AccountGroup())
    }
}
