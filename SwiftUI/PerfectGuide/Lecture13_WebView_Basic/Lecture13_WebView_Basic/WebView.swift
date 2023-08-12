//
//  WebView.swift
//  Lecture13_WebView_Basic
//
//  Created by Leo on 2023/08/12.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> some UIView {

        let url = URL(string: url)
        let request = URLRequest(url: url!)

        let wkWebView = WKWebView()
        wkWebView.load(request)
        
        return wkWebView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

// UIViewController 연결
struct MyWebVC: UIViewControllerRepresentable {
   
    func makeUIViewController(context: Context) -> some UIViewController {
        let webVC = UIStoryboard(name: "WebViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        let navi = UINavigationController(rootViewController: webVC)

        return navi
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
