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
    @State var pinned = false
    
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
                            
                            let pin = UIAction(title: "Pin Memo", image: UIImage(systemName: "pin")) {_ in
                                print("pin memo")
                            }
                            let share = UIAction(title: "Share", image: UIImage(systemName: "person.crop.circle.badge.plus")) {_ in
                                print("share")
                            }
                            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash")?.withTintColor(.red, renderingMode: .alwaysOriginal)) {_ in
                                store.delete(memo: memo)
                            }
                            
                            return UIMenu(title: "", children: [pin, share, delete])
                            
                        } onEnd: {
                            
                            onEnded = true
                        }
                    }
                }
                .padding()
            }
            
            if onEnded {
                NavigationLink(destination: DetailView(memo: memo), isActive: $onEnded) {}
            }
        }
    }
}
