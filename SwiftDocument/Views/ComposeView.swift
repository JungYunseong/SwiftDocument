//
//  ComposeView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/05/03.
//

import SwiftUI

struct ComposeView: View {
    
    @EnvironmentObject var store: MemoStore
    var memo: Memo? = nil
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""
    @State private var memoTitle: String = ""
    @State private var placeholderText: String = "Enter you contents"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Title")
                    .bold()
                    .padding([.top, .leading, .trailing])
                
                TextField("Enter your title", text: $memoTitle)
                    .lineLimit(1)
                    .padding(.horizontal)
                    .onAppear {
                        if let memo = memo {
                            memoTitle = memo.memoTitle
                        }
                    }
                
                Text("Contents")
                    .bold()
                    .padding([.top, .leading, .trailing])
                
                ZStack {
                    if self.content.isEmpty {
                        VStack {
                            TextEditor(text: $placeholderText)
                                .foregroundColor(.gray)
                                .disabled(true)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                    }
                    
                    TextEditor(text: $content)
                        .opacity(self.content.isEmpty ? 0.55 : 1)
                        .padding(.horizontal)
                        .onAppear {
                            if let memo = memo {
                                content = memo.content
                            }
                        }
                }
            }
            .navigationTitle(memo != nil ? "Edit Memo" : "New Memo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let memo = memo {
                            store.update(memo: memo, memoTitle: memoTitle, content: content)
                        } else {
                            store.insert(memoTitle: memoTitle, content: content)
                        }
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
        .accentColor(Color("mOrange"))
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
