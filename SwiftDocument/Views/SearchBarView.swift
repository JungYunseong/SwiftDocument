//
//  SearchBarView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/28.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchKeyword: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchKeyword.isEmpty ? Color("searchBarText") : Color.black
                )
            ZStack(alignment: .leading) {
                if searchKeyword.isEmpty {
                    Text("Search")
                        .foregroundColor(Color("searchBarText"))
                }
                TextField("", text: $searchKeyword)
                    .overlay(
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: 10)
                            .opacity(searchKeyword.isEmpty ? 0.0 : 0.25)
                            .onTapGesture {
                                searchKeyword = ""
                            }
                        ,alignment: .trailing
                    )
            }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color("searchBarBackground"))
                .frame(height: 36)
            
        )
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .previewLayout(.sizeThatFits)
    }
}
