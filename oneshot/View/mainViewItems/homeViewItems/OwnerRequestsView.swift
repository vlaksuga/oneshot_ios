//
//  OwnerRequestsView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct OwnerRequestsView: View {
    
    @Binding var isCurrentView : Bool
    @Binding var requests : [ChoiceRequest]
    
    var body: some View {
        NavigationView {
            ZStack {
                List(requests) { request in
                    NavigationLink(destination: OrderResultView()){
                        RequestItem(request: request)
                    }
                }
                .listStyle(.plain)
                EmptyView(list: requests, msg: "No Requests")
            }
            .navigationBarItems(
                leading : Button(action: { isCurrentView.toggle() }) {
                    Image(systemName: "repeat")
                },
                trailing :
                    NavigationLink(destination: CreateRequestView()) {
                        Image(systemName: "plus")
                    }
            )
            .navigationTitle("My Request")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct OwnerRequestsView_Previews: PreviewProvider {
    
    @State static var isCurrentView : Bool = false
    @State static var requests : [ChoiceRequest] = []
    static var previews: some View {
        OwnerRequestsView(isCurrentView: $isCurrentView, requests: $requests)
    }
}
