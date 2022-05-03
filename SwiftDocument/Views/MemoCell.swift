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
        VStack(alignment: .leading) {
            Text(memo.memoTitle)
                .font(.body)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(memoTitle: "Text()", content: "Test"))
    }
}
