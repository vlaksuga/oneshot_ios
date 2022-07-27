//
//  Choice.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import Foundation


struct Choice: Identifiable, Codable {
    var id : String = ""
    var choiceId: String = "NOCHOICEID"
    var choiceAccountId: String = "NOACCOUNTID"
    var choiceMemo: String = "NOMEMO"
    var choiceProductId: String = "NOPRODUCTID"
    var choiceProductName: String = "NOPRODUCTNAME"
    var choiceProductPrice: Int = -1
    var choiceProductSize: String = "NOPRODUCTSIZE"
    var choiceProductThumb: String = "NOIMAGE"
    var choiceQuantyty: Int = 0
}
