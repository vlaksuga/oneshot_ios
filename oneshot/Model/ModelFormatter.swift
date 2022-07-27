//
//  ModelFormatter.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import Foundation
import Firebase
import Accessibility


class ModelFormatter {
    
    func toChoiceRequest(document doc: QueryDocumentSnapshot) -> ChoiceRequest {
        return ChoiceRequest(
            id: doc.documentID,
            choiceRequestId: doc["choiceRequestId"] as? String ?? "NOREQUESTID",
            createDate: doc["createDate"] as? Int ?? -1,
            createUserId: doc["createUserId"] as? String ?? "NOACCOUNTID",
            createUserName: doc["createUserName"] as? String ?? "NOACCOUNTNAME",
            expireDate: doc["expireDate"] as? Int ?? -1,
            isOpen: doc["isOpen"] as? Bool ?? false,
            requestAccountIdList: doc["requestAccountIdList"] as? [String] ?? [],
            storeId: doc["storeId"] as? String ?? "NOSTOREID",
            storeName: doc["storeName"] as? String ?? "NOSTORENAME",
            storeOrderId: doc["storeOrderId"] as? String ?? "NOORDERID"
        )
    }
    
    func toAccountGroup(document doc: QueryDocumentSnapshot) -> AccountGroup {
        return AccountGroup(
            id: doc.documentID,
            isAvailable: doc["isAvailable"] as? Bool ?? false,
            myAccountGroupId: doc["myAccountGroupId"] as? String ?? "NOGROUPID",
            myAccountGroupName: doc["myAccountGroupName"] as? String ?? "NOGROUPNAME",
            myAccountGroupSize: doc["myAccountGroupSize"] as? Int ?? -1
        )
    }
    
    func toChoice(document doc: QueryDocumentSnapshot) -> Choice {
        return Choice(
            id: doc.documentID,
            choiceId: doc["choiceId"] as? String ?? "NOCHOICEID",
            choiceAccountId: doc["choiceAccountId"] as? String ?? "NOACCOUNTID",
            choiceMemo: doc["choiceMemo"] as? String ?? "NOMEMO",
            choiceProductId: doc["choiceProductId"] as? String ?? "NOPRODUCTID",
            choiceProductName: doc["choiceProductName"] as? String ?? "NOPRODUCTNAME",
            choiceProductPrice: doc["choiceProductPrice"] as? Int ?? -1,
            choiceProductSize: doc["choiceProductSize"] as? String ?? "NOSIZE",
            choiceProductThumb: doc["choiceProductThumb"] as? String ?? "NOTHUMB",
            choiceQuantyty: doc["choiceQuantyty"] as? Int ?? -1
        )
    }
    
    func toProduct(document doc: QueryDocumentSnapshot) -> Product {
        return Product(
            id: doc.documentID,
            isAvailable: doc["isAvailable"] as? Bool ?? false,
            productDescription: doc["productDescription"] as? String ?? "NODESCRIPTION",
            productId: doc["productId"] as? String ?? "NOPRODUCTID",
            productKind: doc["productKind"] as? String ?? "NOKIND",
            productName: doc["productName"] as? String ?? "NONAME",
            productPrice: doc["productPrice"] as? Int ?? -1,
            productSize: doc["productSize"] as? String ?? "NOSIZE",
            productTag: doc["productTag"] as? [String] ?? [],
            productThumb:doc["productThumb"] as? String ?? "NOTHUMB"
        )
    }
    
}
