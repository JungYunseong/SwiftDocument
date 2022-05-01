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
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont.systemFont(ofSize: 21)]
    }
    
    @State var tabSelection: Tabs = .Doc
    @State var searchKeyword: String = ""
    
    var filteredKeyword: [Document] {
        if searchKeyword == "" { return documents }
        return documents.filter {
            $0.title.lowercased().contains(searchKeyword.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                DocListView()
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Doc")
                    }.tag(Tabs.Doc)
                MemoView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Memo")
                    }.tag(Tabs.Memo)
            }
            .navigationBarTitle(self.tabSelection.rawValue, displayMode: .inline)
            .accentColor(Color("mOrange"))
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
