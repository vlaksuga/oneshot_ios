//
//  SelectGroupSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import SwiftUI

struct SelectGroupSheet: View {
    
    var groups: [AccountGroup]
    
    var body: some View {
        VStack {
            Text("Groups")
            List(groups) { group in
                GroupItem(group: group)
            }
            .listStyle(.plain)
        }
    }
}

struct SelectGroupSheet_Previews: PreviewProvider {
    static var previews: some View {
        SelectGroupSheet(groups: [AccountGroup()])
    }
}
