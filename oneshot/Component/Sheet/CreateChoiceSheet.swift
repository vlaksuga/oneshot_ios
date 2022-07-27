//
//  CreateChoiceSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import SwiftUI

struct CreateChoiceSheet: View {
    
    @Binding var product : Product
    @State var selectedAmount : Int = 1
    
    var body: some View {
        VStack {
            Text("Choose Amount")
                .padding()
            Picker("Choose Amount", selection: $selectedAmount) {
                ForEach(1 ..< 10) { number in
                    Text(String(number))
                }
            }
            .pickerStyle(.wheel)
            .cornerRadius(15)
            
            Button {
                createChoice()
            } label: {
                Text("Submit")
            }
            .padding()
            Spacer()
        }
    }
    
    func createChoice() {
        
    }
}

struct CreateChoiceSheet_Previews: PreviewProvider {
    @State static var product : Product = Product()
    static var previews: some View {
        CreateChoiceSheet(product: $product)
    }
}
