//
//  AppLogo.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import SwiftUI

struct AppLogo: View {
    
    var width : CGFloat = 150
    var height : CGFloat = 150
    
    var body : some View {
        VStack {
            Image(systemName : "cup.and.saucer.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.blue)
                .frame(width: width, height: height, alignment: .center)
            Text("ONE SHOT")
                .foregroundColor(Color.blue)
                .font(.system(size: 20, weight: .heavy))
        }
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
