//
//  AccountGroup.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import Foundation


struct AccountGroup : Identifiable, Codable {
    var id : String = ""
    var isAvailable : Bool = true
    var myAccountGroupId : String = "NOGROUPID"
    var myAccountGroupName : String = "NOGROUPNAME"
    var myAccountGroupSize : Int = -1
}
