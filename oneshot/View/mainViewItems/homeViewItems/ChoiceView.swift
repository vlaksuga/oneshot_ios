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
    @State private var selectedProduct : Product = Product()
    var request : ChoiceRequest
    
    var body: some View {
        ZStack {
            List(productViewModel.currentProducts) { product in
                Button {
                    selectedProduct = product
                    isShowChoiceSheet.toggle()
                } label: {
                    ProductItem(product: product)
                }
                .sheet(isPresented: $isShowChoiceSheet) {
                    VStack {
                        HStack {
                            ZStack {
                                Text(selectedProduct.productName)
                                Button {
                                    isShowChoiceSheet.toggle()
                                } label: {
                                    Image(systemName: "xmark")
                                }
                                .frame(alignment: .trailing)
                            }
                        }
                        .padding()
                        CreateChoiceSheet(product: $selectedProduct)
                    }
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
