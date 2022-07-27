//
//  EditChoiceSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import SwiftUI

struct EditChoiceSheet: View {
    
    var selectedChoice: Choice
    
    var body: some View {
        VStack{
            Text(selectedChoice.choiceProductName)
            Text(selectedChoice.choiceProductSize)
            Spacer()
        }
    }
}

struct EditChoiceSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditChoiceSheet(selectedChoice: Choice())
    }
}
