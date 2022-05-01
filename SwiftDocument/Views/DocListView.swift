//
//  DocListView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct DocListView: View {
    
    var category: Category
    var document: Document
    @Binding var filteredKeyword: [Document]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.id) {cat in
                        DocCategoryView(category: cat)
                    }
                }
            }
            .padding(.horizontal)
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
}

struct DocListView_Previews: PreviewProvider {
    static var previews: some View {
        DocListView(category: categories[0], document: documents[0], filteredKeyword: .constant(documents))
    }
}
