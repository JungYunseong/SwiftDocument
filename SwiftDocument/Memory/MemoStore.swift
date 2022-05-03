//
//  MemoStore.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/05/03.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(memoTitle: "Text()", content: "Hello", insertDate: Date.now),
            Memo(memoTitle: "tabView()", content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(memoTitle: "Tab Bars()", content: "Hello", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(memoTitle: memo, content: memo), at: 0)
    }
    
    func update(memo: Memo?, memoTitle: String, content: String) {
        guard let memo = memo else {
            return
        }
        
        memo.content = content
        memo.memoTitle = memoTitle
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
