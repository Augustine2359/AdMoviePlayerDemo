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
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false

        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        view.addSubview(webView)

        addConstraintsToWebView()
        
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

