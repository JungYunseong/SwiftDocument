//
//  MemoView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct MemoView: View {
    
    @EnvironmentObject var store: MemoStore
    @Binding var filteredMemoKeyword: [Memo]
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.top)
            
            List {
                ForEach(filteredMemoKeyword) {memo in
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

//struct MemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoView(filteredMemoKeyword: .constant(store.list))
//            .environmentObject(MemoStore())
//    }
//}
