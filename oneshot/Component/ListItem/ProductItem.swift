//
//  ProductItem.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import SwiftUI

struct ProductItem: View {
    
    var product: Product
    
    var body: some View {
        HStack{
            Image(systemName: "cup.and.saucer")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
            VStack(alignment: .leading, spacing: 5) {
                Text(product.productName)
                Text(product.productSize)
                Text(String(product.productPrice))
                Text(product.productDescription)
            }
            .font(.system(size: 14))
            .padding()
            Spacer()
        }
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: Product())
    }
}
