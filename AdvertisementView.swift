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
    var webView: WKWebView?
    var button: UIButton
    
    required init?(coder aDecoder: NSCoder) {
        button = UIButton(type: .custom)
        super.init(coder: aDecoder)

        button.addTarget(self, action: #selector(onTap), for: UIControlEvents.touchUpInside)

        addConfigurationToWebView()
        translatesAutoresizingMaskIntoConstraints = false
        webView!.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webView!)
        addConstraintsToWebView()
        addSubview(button)
        addConstraintsToButton()
    }

    func addConstraintsToButton() {
        let leftConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: button, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: button, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: button, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: button, attribute: .height, multiplier: 1, constant: 0)

        addConstraint(leftConstraint)
        addConstraint(rightConstraint)
        addConstraint(heightConstraint)
        addConstraint(topConstraint)
    }
    
    func addConstraintsToWebView() {
        let leftConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: webView, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: webView, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: webView, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: webView, attribute: .height, multiplier: 1, constant: 0)
        
        addConstraint(leftConstraint)
        addConstraint(rightConstraint)
        addConstraint(heightConstraint)
        addConstraint(topConstraint)
    }
    
    func addConfigurationToWebView() {
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

    func playAdvertisement(urlString:String) {
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView!.load(urlRequest)
        }
    }
    
    func onTap() {
        let script = "var video = document.getElementsByTagName('video')[0]; if (video.paused)video.play();else video.pause();"
    
        webView!.evaluateJavaScript(script, completionHandler: nil)
    }
}
