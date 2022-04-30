//
//  DocWebView.swift
//  SwiftDocument
//
//  Created by Jung Yunseong on 2022/04/29.
//

import SwiftUI
import WebKit

struct DocWebView: UIViewRepresentable {

    var document: Document
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.document.link) else {
            return WKWebView()
        }
        
        let webview = WKWebView()
        
        webview.load(URLRequest(url: url))
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext <DocWebView>) {
        
    }
    
}

struct DocWebView_Previews: PreviewProvider {
    static var previews: some View {
        DocWebView(document: documents[0])
    }
}
