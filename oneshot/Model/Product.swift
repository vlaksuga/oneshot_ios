//
//  Product.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import Foundation

struct Product : Identifiable, Codable {
    var id: String = ""
    var isAvailable: Bool = true
    var productDescription: String = "NODESCRIPTION"
    var productId: String = "NOID"
    var productKind: String = "NOKIND"
    var productName: String = "NONAME"
    var productPrice: Int = -1
    var productSize: String = "NOSIZE"
    var productTag: [String] = ["NOTAG"]
    var productThumb: String = "NOIMAGE"
}
