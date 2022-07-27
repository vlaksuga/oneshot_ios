//
//  EmptyView.swift
//  oneshot
//
//  Created by Rockteki on 2022/07/26.
//

import SwiftUI

struct EmptyView: View {
    var list : [Any] = []
    var msg : String = ""
    var body: some View {
        Text(msg)
            .opacity(list.count <= 0 ? 1 : 0)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
