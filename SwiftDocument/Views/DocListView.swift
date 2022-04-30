//
//  DocListView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct DocListView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1...10, id: \.self) {index in
                    DocListRow(document: documents[index])
                        .padding(.horizontal)
                }
            }
        }
        .padding(.bottom)
    }
}

struct DocListView_Previews: PreviewProvider {
    static var previews: some View {
        DocListView()
    }
}
