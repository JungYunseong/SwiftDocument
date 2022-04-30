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
                ForEach(documents, id: \.id) {document in
                    DocListRow(document: document)
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
