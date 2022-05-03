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
            Memo(memoTitle: "Search Bars", content: "SwiftUI에서는 어떻게 구현하는지 알아보자!", insertDate: Date.now),
            Memo(memoTitle: "Scroll Views", content: "집에가서 Scroll View에 대해 한번더 읽어보자", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(memoTitle: "TextField", content: "Secure TextField의 경우는 어떻게 구현하는지 아카데미 멘토분께 물어봐야지", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memoTitle: String, content: String) {
        list.insert(Memo(memoTitle: memoTitle, content: content), at: 0)
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
