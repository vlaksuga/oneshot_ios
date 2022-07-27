//
//  CreateGroupView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct CreateGroupView: View {
    
    @State private var groupName: String = ""
    @State var selectedAccounts: [Account] = [Account()]
    @State private var isShowAccountSheet = false
    
    var body: some View {
        VStack {
            TextField("Group Name", text: $groupName)
                .padding()
                .disableAutocorrection(true)
            HStack{
                Text("Selected Account")
                Spacer()
                Button(action: { isShowAccountSheet.toggle()}) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isShowAccountSheet) {
                    AccountItem(account: Account())
                }
            }
            .padding()
            List(selectedAccounts) { account in
                AccountItem(account: account)
            }
            .listStyle(.plain)
            Button("Submit") {
                submitCreateGroup()
            }
            .padding()
        }
        .textFieldStyle(.roundedBorder)
        
        .navigationTitle("Create Group")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func submitCreateGroup(){
        
    }
}

struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
