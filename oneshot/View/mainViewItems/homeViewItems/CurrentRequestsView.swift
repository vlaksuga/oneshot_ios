//
//  CurrentRequestsView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct CurrentRequestsView: View {
    
    @Binding var isCurrentView : Bool
    @Binding var requests : [ChoiceRequest]
    
    var body: some View {
        NavigationView {
            ZStack {
                List(requests) { request in
                    NavigationLink(destination: ChoiceResultView(request: request)){
                        RequestItem(request: request)
                    }
                }
                .listStyle(.plain)
                EmptyView(list: requests, msg: "No Requests")
            }
            .navigationBarItems(
                leading :
                    Button(action: { isCurrentView.toggle() }) {
                        Image(systemName: "repeat")
                    },
                trailing :
                    NavigationLink(destination: CreateRequestView()) {
                        Image(systemName: "plus")
                    }
            )
            .navigationTitle("Current Request")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CurrentRequestsView_Previews: PreviewProvider {
    
    @State static var isCurrentView : Bool = false
    @State static var requests : [ChoiceRequest] = []
    static var previews: some View {
        CurrentRequestsView(isCurrentView: $isCurrentView, requests: $requests)
    }
}
