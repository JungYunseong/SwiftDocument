//
//  MemoView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct MemoView: View {
    
    @EnvironmentObject var store: MemoStore
    @ObservedObject var memo: Memo
    @Binding var filteredMemoKeyword: [Memo]
    @State private var showComposer = false
    
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
                    //                .onDelete(perform: store.delete)
                    .contextMenu {
                        VStack {
                            Button(action: {
                                showComposer = true
                            }) {
                                Text("Edit")
                            }
                            
                            Button(role: .destructive) {
                                store.delete(memo: memo)
                            } label: {
                                Text("Delete")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .sheet(isPresented: $showComposer) {
                        ComposeView(memo: memo)
                    }
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
