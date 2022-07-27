//
//  ChoiceView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct ChoiceView: View {
    
    @EnvironmentObject var productViewModel : ProductViewModel
    @State private var isShowChoiceSheet : Bool = false
    var request : ChoiceRequest
    
    var body: some View {
        ZStack {
            List(productViewModel.currentProducts) { product in
                Button {
                    isShowChoiceSheet.toggle()
                } label: {
                    ProductItem( product: product)
                }
                .sheet(isPresented: $isShowChoiceSheet) {
                    CreateChoiceSheet(product: product)
                }
            }
            .listStyle(.plain)
            EmptyView(list: productViewModel.currentProducts, msg: "No Product")
        }
        .onAppear {
            productViewModel.attachCurrentProducts(storeId: request.storeId)
        }
        
        .navigationTitle(request.storeName)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView(request: ChoiceRequest())
    }
}
