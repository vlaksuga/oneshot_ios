//
//  Store.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/22.
//

import Foundation

struct Store: Identifiable, Codable {
    var id = UUID()
    var storeId: String = "NOID"
    var storeName: String = "NONAME"
}
