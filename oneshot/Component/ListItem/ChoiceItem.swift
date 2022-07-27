//
//  ChoiceItem.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct ChoiceItem: View {
    
    var choice: Choice
    
    var body: some View {
        HStack{
            Image(systemName: "cup.and.saucer")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
            VStack(alignment: .leading, spacing: 5) {
                Text(choice.choiceProductName)
                Text(String(choice.choiceQuantyty))
                Text(String(choice.choiceProductPrice))
                Text(choice.choiceMemo)
            }
            .font(.system(size: 14))
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct ChoiceItem_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceItem(choice: Choice())
    }
}
