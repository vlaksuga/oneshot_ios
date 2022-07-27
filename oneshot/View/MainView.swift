//
//  MainView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("HOME")
            }
            GroupView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Group")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("More")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
