//
//  oneshotApp.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/20.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct oneshotApp: App {
    
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var requestViewModel = RequestViewModel()
    @StateObject var grouopViewModel = GroupViewModel()
    @StateObject var choiceViewModel = ChoiceViewModel()
    @StateObject var productViewModel = ProductViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .environmentObject(requestViewModel)
                .environmentObject(grouopViewModel)
                .environmentObject(choiceViewModel)
                .environmentObject(productViewModel)
        }
    }
}
