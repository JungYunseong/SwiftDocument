//
//  MemoView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct MemoView: View {
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.top)
            
            NavigationView {
                List(store.list) {memo in
                    VStack(alignment: .leading) {
                        Text(memo.content)
                            .font(.body)
                            .lineLimit(1)
                        
                        Text(memo.insertDate, style: .date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .listStyle(.plain)
                .navigationBarHidden(true)
            }
        }
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
            .environmentObject(MemoStore())
    }
}
