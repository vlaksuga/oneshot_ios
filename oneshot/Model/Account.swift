//
//  Account.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/25.
//

import Foundation

struct Account : Identifiable, Codable {
    var id : String = "NOID"
    var accountId : String = "NOACCOUNTID"
    var accountName : String = "NOACCOUNTNAME"
    var accountSearchHint : [String] = ["NOACCOUNTSEARCHHINT"]
}
