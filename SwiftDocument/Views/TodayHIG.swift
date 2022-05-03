////
////  TodayHIG.swift
////  SwiftDocument
////
////  Created by Jung Yunseong on 2022/05/01.
////
//
//import SwiftUI
//import WebKit
//
//struct TodayHIG: UIViewRepresentable {
//
//    var document: Document
//
//    func makeUIView(context: Context) -> WKWebView {
//
//        guard let url = URL(string: self.document.link)
//        else {
//            return WKWebView()
//        }
//
//        let webview = WKWebView()
//
//        webview.load(URLRequest(url: url))
//        return webview
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext <TodayHIG>) {
//
//    }
//
//}
