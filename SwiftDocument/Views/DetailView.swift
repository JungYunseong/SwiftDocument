//
//  DetailView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/05/03.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var memo: Memo
    @EnvironmentObject var store: MemoStore
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            Text(memo.content)
                                .padding()
                            
                            Spacer(minLength: 0)
                        }
                        
                        Text(memo.insertDate, style: .date)
                            .padding()
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle(memo.memoTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        showDeleteAlert = true
                    } label: {
                        Image(systemName: "trash")
                    }
                    .foregroundColor(.red)
                    .alert("Delete \"\(memo.memoTitle)\"?", isPresented: $showDeleteAlert) {
                        Button(role: .destructive) {
                            store.delete(memo: memo)
                            dismiss()
                        } label: {
                            Text("Delete")
                        }
                    } message: {
                        Text("You cannot undo this action")
                    }
                    
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .foregroundColor(Color("mOrange"))
                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView(memo: memo)
        }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(memoTitle: "Text()", content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
