//
//  ChoiceResultView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct ChoiceResultView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var choiceViewModel : ChoiceViewModel
    @State var isShowChoiceSheet = false
    
    var request : ChoiceRequest
    
    var body: some View {
        ZStack {
            List(choiceViewModel.currentChoices){ choice in
                Button(action: {
                    isShowChoiceSheet.toggle()
                }) {
                    ChoiceItem(choice: choice)
                }
                .foregroundColor(Color.primary)
                .sheet(isPresented: $isShowChoiceSheet) {
                    EditChoiceSheet(selectedChoice: choice)
                }
            }
            .listStyle(.plain)
            EmptyView(list: choiceViewModel.currentChoices, msg: "No Choices")
        }
        .onAppear {
            choiceViewModel.attachCurrentChoices(storeId: request.storeId, accountId: authViewModel.accountId, orderId: request.storeOrderId)
        }
    
        .navigationBarItems(
            trailing :
                NavigationLink(destination: ChoiceView(request: request)) {
                    Image(systemName: "plus")
                }
        )
        .navigationTitle("My Choices")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChoiceResultView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceResultView(request: ChoiceRequest())
    }
}
