//
//  MemoView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct MemoView: View {
    var body: some View {
        VStack {
            Text("Memo")
                .font(.system(size: 21))
                .padding(.top)
            SearchBarView()
            Spacer()
        }
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
    }
}
