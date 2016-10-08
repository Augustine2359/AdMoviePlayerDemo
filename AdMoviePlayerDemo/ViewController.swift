//
//  ViewController.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/08.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var webView: WKWebView

    required init?(coder aDecoder: NSCoder) {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        
        if #available(iOS 10.0, *) {
            configuration.mediaTypesRequiringUserActionForPlayback = []
        }
        else if #available(iOS 9.0, *) {
            configuration.requiresUserActionForMediaPlayback = false
        } else {
            // Fallback on earlier versions
        }
        
        let userContentController = WKUserContentController()
        var userScript = WKUserScript(source: "document.getElementsByTagName('video')[0].setAttribute('webkit-playsinline', '')", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(userScript)
        userScript = WKUserScript(source: "document.getElementsByTagName('video')[0].removeAttribute('controls')", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(userScript)
        configuration.userContentController = userContentController
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false

        super.init(coder: aDecoder)
        webView.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        view.addSubview(webView)

        addConstraintsToWebView()

        let urlString = "http://hitokuse.com/videos/top-video.mp4"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addConstraintsToWebView() {
        let leftConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: webView, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: webView, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: topLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: webView, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: webView, attribute: .height, multiplier: 2, constant: 0)
        
        view.addConstraint(leftConstraint)
        view.addConstraint(rightConstraint)
        view.addConstraint(heightConstraint)
        view.addConstraint(topConstraint)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("did commit")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
        print("failed")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error)
        print(navigation)
        print("failed provisioning")
    }
}
