//
//  AppLoginView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import SwiftUI

struct AppLoginView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @State private var accountName : String = ""
    @State private var accountSearchHint : String = ""
    @State private var hasChecked : Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            AppLogo()
            Spacer()
            TextField("Account Name", text: $accountName)
                .textFieldStyle(.roundedBorder)
            TextField("Tags", text: $accountSearchHint)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button {
                createFirebaseAccount()
            } label: {
                Text("Submit")
            }
            .padding()
        }
        .onAppear() {
            authViewModel.checkFirestoreAccount()
        }
    }
    
    func createFirebaseAccount() {
        let hints : [String] = accountSearchHint.components(separatedBy: "#")
        authViewModel.firestoreCreateAccount(accountName: accountName, searchHint: hints)
    }
}

struct AppLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppLoginView()
    }
}
