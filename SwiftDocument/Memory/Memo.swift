//
//  Memo.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/05/03.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var memoTitle: String
    @Published var content: String
    let insertDate: Date
    
    init(memoTitle: String, content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.memoTitle = memoTitle
        self.content = content
        self.insertDate = insertDate
    }
}
