//
//  GroupView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct GroupView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var groupViewModel : GroupViewModel
    @State var isShowGroupSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List(groupViewModel.currentGroups) { group in
                    Button(action: {isShowGroupSheet.toggle()}) {
                        GroupItem(group: group)
                    }
                    .sheet(isPresented: $isShowGroupSheet) {
                        EditGroupSheet(group: group)
                    }
                    
                }
                .listStyle(.plain)
                EmptyView(list: groupViewModel.currentGroups, msg: "No Groups")
            }
            .navigationBarItems(
                trailing :
                    NavigationLink(destination: CreateGroupView()) {
                        Image(systemName: "plus")
                    }
            )
            .navigationTitle("My Group")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            groupViewModel.attachCurrentGroups(accountId: authViewModel.accountId)
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
