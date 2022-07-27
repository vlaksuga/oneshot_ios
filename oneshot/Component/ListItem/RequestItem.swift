//
//  RequestItem.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/21.
//

import SwiftUI

struct RequestItem: View {
    var request: ChoiceRequest
    
    var body: some View {
        Text(request.createUserName)
    }
}

struct RequestItem_Previews: PreviewProvider {
    static var previews: some View {
        RequestItem(request: ChoiceRequest())
    }
}
