//
//  DocListRow.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct DocListRow: View {
    
    var document: Document
    var memo: Memo? = nil
    @EnvironmentObject var store: MemoStore
    @State private var showComposer = false
    
    var body: some View {
        NavigationLink(
            destination: DocWebView(document: document)
                .edgesIgnoringSafeArea(.bottom)
                .toolbar {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
                .sheet(isPresented: $showComposer) {
                    DocMemoView(memo: Memo(memoTitle: "✍🏻 \(document.title)", content: ""))
                }
        ) {
            ZStack {
                
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .shadow(color: Color("listShadow"), radius: 2, x: 0, y: 2)
                
                VStack(alignment: .leading, spacing: 3.0) {
                    
                    Text(document.category)
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 1)
                        .background(Color(document.category))
                        .clipShape(Capsule())
                        .padding([.leading, .top], 10)
                    
                    Text(document.title)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 10)
                        .offset(x: 1, y:2)
                    
                    Text(document.subtitle)
                        .font(.system(size: 10))
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("listSubHeadline"))
                        .padding(.horizontal, 10)
                        .offset(x: 1)
                    Spacer(minLength: 0)
                } // VStack
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                
            } // ZStack
            .frame(height: 100)
        }
    }
}

struct DocListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DocListRow(document: documents[0])
                .environmentObject(MemoStore())
                .previewLayout(.sizeThatFits)
            DocListRow(document: documents[1])
                .environmentObject(MemoStore())
                .previewLayout(.sizeThatFits)
        }
    }
}
