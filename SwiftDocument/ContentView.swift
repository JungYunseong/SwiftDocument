//
//  ContentView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                DocView()
                    .navigationBarHidden(true)
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Doc")
                    }.tag(1)
                MemoView()
                    .navigationBarHidden(true)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Memo")
                    }.tag(2)
            }
            .accentColor(Color("mOrange"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
