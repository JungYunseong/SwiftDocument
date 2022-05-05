//
//  MemoCell.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/05/03.
//

import SwiftUI

struct MemoCell: View {
    
    @ObservedObject var memo: Memo
    
    var body: some View {
        ZStack {
            Image("PostIt")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(alignment: .leading, spacing: 3.0) {
                
                Text(memo.memoTitle)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .foregroundColor(Color.black)
                    .padding([.top, .leading, .trailing], 10)
                    .offset(x: 1, y:2)
                
                Text(memo.content)
                    .font(.system(size: 12))
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("memoSub"))
                    .padding(.horizontal, 10)
                    .offset(x: 1)
                Spacer(minLength: 0)
                
                HStack {
                    Spacer()
                    
                    Text(memo.insertDate, style: .date)
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                        .padding(5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading)
        }
        .frame(height: 200)
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(memoTitle: "Text()", content: "Test"))
            .previewLayout(.sizeThatFits)
    }
}
