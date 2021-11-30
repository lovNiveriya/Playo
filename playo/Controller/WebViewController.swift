//
//  WebViewController.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import UIKit
import WebKit
import MLTontiatorView

class WebViewController: UIViewController, WKNavigationDelegate{

    var webViewURL:String = ""
    var webView: WKWebView!
    let viewActivitySmall = MLTontiatorView()
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        let url = URL(string: webViewURL)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewActivitySmall.spinnerSize = .MLSpinnerSizeMedium
        viewActivitySmall.spinnerColor = UIColor.black
        self.view.isUserInteractionEnabled = false
        self.addActivityIndicatorToView(activityIndicator: self.viewActivitySmall, view: self.view)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .blue
        self.navigationController?.navigationBar.backgroundColor = .white
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewActivitySmall.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    // Function for loader animation start
    func addActivityIndicatorToView(activityIndicator: MLTontiatorView, view: UIView){

        self.view.addSubview(activityIndicator)

        viewActivitySmall.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))

        activityIndicator.startAnimating()

    }

}

//MARK: WebView Delegate
extension ViewController{

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Started to load")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.viewActivitySmall.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
}
