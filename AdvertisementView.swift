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
    var videoURLString: String
        
    required init?(coder aDecoder: NSCoder) {
        button = UIButton()
        videoURLString = "http://hitokuse.com/videos/top-video.mp4"
        super.init(coder: aDecoder)
        translatesAutoresizingMaskIntoConstraints = false
        addConstraintsToWebView()
        addConfigurationToWebView()
    }

    init(videoURL: String) {
        button = UIButton()
        videoURLString = videoURL
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConfigurationToWebView()
        webView!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webView!)
        addConstraintsToWebView()
        
        advertisementPlay()
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
    
    func advertisementPlay() {
        let url = URL(string: videoURLString)!
        let urlRequest = URLRequest(url: url)
        webView!.load(urlRequest)
    }
}
