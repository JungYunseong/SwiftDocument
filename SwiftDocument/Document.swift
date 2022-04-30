//
//  Document.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/30.
//

import Foundation
import SwiftUI

struct Document: Identifiable, Decodable {
    var id: Int
    var category: String
    var title: String
    var subtitle: String
    var link: String
}
