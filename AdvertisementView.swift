//
//  AdvertisementView.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/09.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class AdvertisementView: UIView {
    var webView: UIView?
    var button: UIButton
    var redirectURLString: String?
    
    required init?(coder aDecoder: NSCoder) {
        button = UIButton(type: .custom)
        super.init(coder: aDecoder)

        defaultInitializations()
    }
    
    override init(frame: CGRect) {
        button = UIButton(type: .custom)
        super.init(frame: frame)
        
        defaultInitializations()
    }

    func defaultInitializations() {
        backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(onTap), for: UIControlEvents.touchUpInside)

        addConfigurationToWebView()
        webView!.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webView!)
        addConstraintsFor(subview: webView!)
        addSubview(button)
        addConstraintsFor(subview: button)
    }
    
    func addConstraintsFor(subview: UIView) {
        let leftConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: subview, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: subview, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: subview, attribute: .height, multiplier: 1, constant: 0)
        
        addConstraint(leftConstraint)
        addConstraint(rightConstraint)
        addConstraint(heightConstraint)
        addConstraint(topConstraint)
    }
    
    func useWKWebView() {
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
    }
    
    func useUIWebView() {
        webView = UIWebView(frame: .zero)
        let uiWebView = webView as? UIWebView
        uiWebView?.delegate = self
        uiWebView?.mediaPlaybackRequiresUserAction = false
        uiWebView?.allowsInlineMediaPlayback = true
    }
    
    func addConfigurationToWebView() {
        if #available(iOS 9.0, *) {
            useWKWebView()
        }
        else {
            useUIWebView()
        }
    }
    
    func playAdvertisement(urlString:String) {
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            if let wkWebView = webView as? WKWebView {
                wkWebView.load(urlRequest)
            }
            else if let uiWebView = webView as? UIWebView {
                uiWebView.loadRequest(urlRequest)
            }
        }
    }
    
    func onTap() {
//        let script = "document.getElementsByTagName('video')[0].pause();"
        
//        webView!.evaluateJavaScript(script, completionHandler: nil)
        
        guard (redirectURLString == nil) else {
            let url = URL(string: redirectURLString!)!
            UIApplication.shared.openURL(url)
            
            return
        }
    }
}

extension AdvertisementView: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("did start load")
        
        //        print(webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('video')[0].setAttribute('webkit-playsinline', '')"))
        //        print(webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('video')[0].removeAttribute('controls')"))
        //                var userScript = WKUserScript(source: "document.getElementsByTagName('video')[0].setAttribute('webkit-playsinline', '')", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        //                userContentController.addUserScript(userScript)
        //                userScript = WKUserScript(source: "document.getElementsByTagName('video')[0].removeAttribute('controls')", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        //        webView.evaluate
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("did finish load")
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
//        print(webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('video')[0].setAttribute('webkit-playsinline', '')"))
//        print(webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('video')[0].removeAttribute('controls')"))
        print("fail load")
        print(error)
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("should start load")
        return true
    }
}
