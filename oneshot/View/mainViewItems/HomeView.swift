//
//  HomeView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/20.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var requestViewModel : RequestViewModel
    
    @State var isCurrentView : Bool = true;
    
    var body: some View {
        VStack {
            if(isCurrentView) {
                CurrentRequestsView(isCurrentView: $isCurrentView, requests: $requestViewModel.currentRequests)
            } else {
                OwnerRequestsView(isCurrentView: $isCurrentView, requests: $requestViewModel.ownerRequests)
            }
            Spacer()
        }
        .onAppear{
            requestViewModel.attachRequests(accountId: authViewModel.accountId)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
