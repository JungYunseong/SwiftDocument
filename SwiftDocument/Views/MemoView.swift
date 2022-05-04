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
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing:-20), count: 2)) {
                ForEach(filteredMemoKeyword) {memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
                }
            }
            .listStyle(.plain)
            .padding(.top, 0)
        }
    }
}

//struct MemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoView(filteredMemoKeyword: store.list)
//            .environmentObject(MemoStore())
//    }
//}
