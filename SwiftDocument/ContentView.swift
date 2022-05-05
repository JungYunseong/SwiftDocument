//
//  ContentView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    
    enum Tabs: String {
        case Doc = "Document"
        case Memo = "Memo"
    }
    
    @EnvironmentObject var store: MemoStore
    
    @State var tabSelection: Tabs = .Doc
    @State private var isCustomViewPresented = false
    @State private var showComposer: Bool = false
    @State var searchDocKeyword: String = ""
    @State var searchMemoKeyword: String = ""
    
    var filteredDocKeyword: [Document] {
        if searchDocKeyword == "" { return documents }
        return documents.filter {
            $0.title.lowercased().contains(searchDocKeyword.lowercased())
        }
    }
    
    var filteredMemoKeyword: [Memo] {
        if searchMemoKeyword == "" { return store.list }
        return store.list.filter {
            $0.memoTitle.lowercased().contains(searchMemoKeyword.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                DocListView(category: categories[0], document: documents[0], filteredDocKeyword: .constant(filteredDocKeyword))
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Doc")
                    }.tag(Tabs.Doc)
                
                MemoView(memo: store.list[0], filteredMemoKeyword: .constant(filteredMemoKeyword))
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Memo")
                    }.tag(Tabs.Memo)
            }
            .navigationBarTitle(self.tabSelection.rawValue, displayMode: .inline)
            .toolbar {
                if tabSelection == Tabs.Doc {
                    Button {
                        isCustomViewPresented.toggle()
                    } label: {
                        Image(systemName: "doc.text.image")
                    }
                    .fullScreenCover(isPresented: $isCustomViewPresented,
                                     content: {
                        ZStack {
                            Text("Random HIG")
                                .font(.body)
                                .bold()
                            
                            HStack {
                                Spacer()
                                
                                Button(action: { isCustomViewPresented.toggle() },
                                       label: {
                                    Text("Done")
                                        .foregroundColor(Color("mOrange"))
                                        .padding(.horizontal)
                                })
                            }
                        }
                        DocWebView(document: documents[Int.random(in: 1..<85)])
                            .edgesIgnoringSafeArea(.bottom)
                    })
                } else if tabSelection == Tabs.Memo {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showComposer) {
                        ComposeView()
                    }
                }
            }
        }
        .searchable(text: tabSelection == Tabs.Doc ? $searchDocKeyword : $searchMemoKeyword)
        .accentColor(Color("mOrange"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MemoStore())
    }
}
