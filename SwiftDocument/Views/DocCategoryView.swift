//
//  DocCategoryView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/05/01.
//

import SwiftUI

struct DocCategoryView: View {
    
    var category: Category
    @State private var isActivated: Bool = true
    
    var body: some View {
        Text(category.category)
            .font(.system(size: 17))
            .foregroundColor(isActivated ? Color.white : Color.gray)
            .padding(.horizontal, 12)
            .padding(.vertical, 2)
            .overlay(
                Capsule()
                    .stroke(.gray, lineWidth: isActivated ? 0 : 2)
            )
            .background(isActivated ? Color(category.category) : Color("searchBarBackground"))
            .clipShape(Capsule())
            .onTapGesture {
                print(category.category)
                withAnimation {
                    self.isActivated.toggle()
                }
            }
    }
}

struct DocCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DocCategoryView(category: categories[0])
                .previewLayout(.sizeThatFits)
            DocCategoryView(category: categories[1])
                .previewLayout(.sizeThatFits)
        }
    }
}
