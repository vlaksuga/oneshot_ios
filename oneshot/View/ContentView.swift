//
//  ContentView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        switch authViewModel.state {
            case .reg : IntroView()
            case .signOut : LoginView()
            case .firebaseSignIn : AppLoginView()
            case .appSignIn : MainView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
