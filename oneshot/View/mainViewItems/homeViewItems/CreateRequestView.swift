//
//  CreateRequestView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct CreateRequestView: View {
    
    @State private var isShowGroupSheet = false
    @State private var isShowStoreSheet = false
    @State var selectedGroup : AccountGroup? = nil
    @State var selectedStore : Store? = nil
    
    var body: some View {
        VStack{
            Button("Groups") { isShowGroupSheet = true }
                .sheet(isPresented: $isShowGroupSheet) { SelectGroupSheet(groups:[AccountGroup()]) }
            Button("Stores") { isShowStoreSheet = true }
            .sheet(isPresented: $isShowStoreSheet) { SelectStoreSheet(stores:[Store()]) }
            Spacer()
            Button("Submit") { createRequests() }
        }
        .padding()
        
        .navigationTitle("Create Request")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func createRequests() {
        print("xx")
    }
    
    
}

struct CreateRequestView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRequestView()
    }
}
