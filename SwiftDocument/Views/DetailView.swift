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
            
            Image("PostIt")
                .resizable()
                .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text(memo.memoTitle)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .padding(.horizontal, 40)
                    .padding(.top, 30)
                
                ScrollView {
                    HStack() {
                        Text(memo.content)
                            .padding(.horizontal, 40)
                        
                        Spacer(minLength: 0)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                HStack {
                    Spacer()
                    Text(memo.insertDate, style: .date)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(30)
                    Spacer()
                }
            }
            .navigationTitle("")
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
            .fullScreenCover(isPresented: $showComposer) {
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
