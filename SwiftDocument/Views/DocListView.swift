//
//  DocListView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct DocListView: View {

    @Binding var filteredKeyword: [Document]
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("background")
                VStack {
                    ForEach(filteredKeyword, id: \.id) {doc in
                        DocListRow(document: doc)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .padding(.bottom)
    }
}

struct DocListView_Previews: PreviewProvider {
    static var previews: some View {
        DocListView(filteredKeyword: .constant(documents))
    }
}
