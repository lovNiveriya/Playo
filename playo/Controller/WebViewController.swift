//
//  WebViewController.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    var webViewURL:String = ""
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: webViewURL)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

    }
}

//MARK: WebView Delegate
extension ViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Started to load")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
}
