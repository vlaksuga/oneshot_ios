//
//  LoginView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/25.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.blue)
                .frame(width: 150, height: 150, alignment: .center)
            Text("ONE SHOT")
                .foregroundColor(Color.blue)
                .font(.system(size: 20, weight: .heavy))
            Spacer()
            GoogleLogInButton()
                .frame(width: 300, height: 50)
                .padding()
                .onTapGesture{
                    authViewModel.googleLogIn()
                }
        }
    }
    
    func googleLogin() {}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
