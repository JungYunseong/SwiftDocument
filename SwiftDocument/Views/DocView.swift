//
//  DocView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/28.
//

import SwiftUI

struct DocView: View {
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.top)
            VStack {
                SearchBarView()
                DocListView()
            }
        }
    }
}

struct DocView_Previews: PreviewProvider {
    static var previews: some View {
        DocView()
    }
}
