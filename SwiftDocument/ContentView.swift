//
//  ContentView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 21)]
    }
    
    @State private var isCustomViewPresented = false
    @State private var showingProfileEditor = false
    @State var searchKeyword: String = ""
    
    var filteredKeyword: [Document] {
        if searchKeyword == "" { return documents }
        return documents.filter {
            $0.title.lowercased().contains(searchKeyword.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            DocListView(category: categories[0], document: documents[0], filteredKeyword: .constant(filteredKeyword))
                .navigationBarTitle("Document", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isCustomViewPresented.toggle()
                        } label: {
                            Image(systemName: "doc.text.image")
                        }
                        .fullScreenCover(isPresented: $isCustomViewPresented,
                                         content: {
                            HStack {
                                Spacer()
                                Button(action: { isCustomViewPresented.toggle() },
                                       label: {
                                    Text("Done")
                                        .foregroundColor(Color("mOrange"))
                                        .padding(.horizontal)
                                })
                            }
                            TodayHIG()
                        })
                    }
                }
        }
        .searchable(text: $searchKeyword) {
            
        }
        .accentColor(Color("mOrange"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
