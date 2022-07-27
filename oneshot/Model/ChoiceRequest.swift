//
//  ChoiceRequest.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import Foundation

struct ChoiceRequest : Identifiable, Codable {
    var id : String = ""
    var choiceRequestId: String = "NOREQUESTID"
    var createDate: Int = 0
    var createUserId: String = "NOUSERID"
    var createUserName: String = "NOUSERNAME"
    var expireDate: Int = 0
    var isOpen: Bool = true
    var requestAccountIdList: [String] = ["NOACCOUNTID"]
    var storeId: String = "NOSTOREID"
    var storeName: String = "NOSTORENAME"
    var storeOrderId: String = "NOORDERID"
}
