//
//  WebViewController.swift
//  Lecture13_WebView_Basic
//
//  Created by Leo on 2023/08/12.
//

import UIKit
import WebKit

// WebKit은 SwiftUI로만 만들 수는 없음

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    private var url = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        self.webView.load(URLRequest(url: URL(string: url)!))
    }
    
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

        // get webView Title
        self.webView.evaluateJavaScript("document.title") { (result, error) in
            self.navigationItem.title = result as? String
        }
    }
}
