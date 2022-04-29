//
//  DocListRow.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI

struct DocListRow: View {
    var body: some View {
        NavigationLink(destination: DocWebView()) {
            ZStack {
                
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .shadow(color: Color("listShadow"), radius: 2, x: 0, y: 2)
                
                VStack(alignment: .leading, spacing: 5.0) {
                    
                    Text("HIG")
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 1)
                        .background(Color("mOrange"))
                        .clipShape(Capsule())
                        .padding([.leading, .top], 10)
                    
                    Text("Tab Bars")
                        .font(.system(size: 18))
                        .foregroundColor(Color.black)
                        .padding(.leading, 10)
                        .offset(x: 2)
                    
                    Text("A tab bar appears at the bottom of a screen, helping people understand the types of information or functionality an app provides.")
                        .font(.system(size: 10))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .foregroundColor(Color("listSubHeadline"))
                        .padding(.horizontal, 10)
                        .offset(x: 4)
                    Spacer()
                } // VStack
                
            } // ZStack
            .frame(height: 100)
        }
    }
}

struct DocListRow_Previews: PreviewProvider {
    static var previews: some View {
        DocListRow()
    }
}
