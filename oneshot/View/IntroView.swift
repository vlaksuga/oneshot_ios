//
//  IntroView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import SwiftUI

struct IntroView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            AppLogo()
            Spacer()
        }
        .onAppear {
            authViewModel.checkFirebaseAuth()
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
