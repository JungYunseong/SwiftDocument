//
//  MemoView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct MemoView: View {
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.top)
            
            List {
                ForEach(store.list) {memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .listStyle(.plain)
        }
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
            .environmentObject(MemoStore())
    }
}
