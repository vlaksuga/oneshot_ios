//
//  CreateChoiceSheet.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import SwiftUI

struct CreateChoiceSheet: View {
    
    var product : Product
    
    var body: some View {
        VStack{
            Text(product.productName)
            Spacer()
        }
    }
}

struct CreateChoiceSheet_Previews: PreviewProvider {
    static var previews: some View {
        CreateChoiceSheet()
    }
}
