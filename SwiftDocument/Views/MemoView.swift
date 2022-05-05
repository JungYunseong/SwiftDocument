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
    @State var onEnded = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredMemoKeyword) {memo in
                        CustomContextMenu {
                            Label {
                                NavigationLink {
                                    DetailView(memo: memo)
                                } label: {
                                    MemoCell(memo: memo)
                                }
                            } icon: { }
                            
                        } preview: {
                            DetailView(memo: memo)
                            
                        } actions: {
                            
                            let edit = UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) {_ in
                                print("edit")
                            }
                            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash")?.withTintColor(.red, renderingMode: .alwaysOriginal)) {_ in
                                store.delete(memo: memo)
                            }
                            
                            return UIMenu(title: "", children: [edit, delete])
                            
                        } onEnd: {
                            onEnded = true
                        }
                    }
                }
            }
            .padding()
            
            if onEnded {
                NavigationLink(destination: DetailView(memo: memo), isActive: $onEnded) {}
            }
        }
    }
}
