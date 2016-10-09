//
//  AdvertisementViewFullScreen.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/10.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit

protocol AdvertisementViewFullScreenManagerProtocol {
    func onDismissFullScreenAdvertisement()
}

class AdvertisementViewFullScreenManager {
    static let sharedInstance = AdvertisementViewFullScreenManager()
    var blockingView: UIView?
    var advertisementView: AdvertisementView?
    var segueAfterDismiss: (performingViewController: UIViewController, segueIdentifier: String)?

    func blockScreen(withVideo stringURL:String, redirectURLString:String) {
        if let window = UIApplication.shared.keyWindow {
            blockingView = UIView(frame: CGRect(x: 0, y: 0, width: window.frame.size.width, height: window.frame.size.height))
            blockingView!.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blockingView!)
            
            advertisementView = AdvertisementView(frame: .zero)
            advertisementView!.translatesAutoresizingMaskIntoConstraints = false
            blockingView!.addSubview(advertisementView!)
            addConstraintsFor(superview: blockingView!, subview: advertisementView!)

            advertisementView?.playAdvertisement(urlString: stringURL)
            advertisementView?.redirectURLString = redirectURLString
            
            let touch = UITapGestureRecognizer(target: self, action: #selector(onTap))
            blockingView!.addGestureRecognizer(touch)
        }
    }
    
    @objc func onTap() {
        advertisementView?.pauseAdvertisement()
        blockingView?.removeFromSuperview()
        if let segueIdentifier = segueAfterDismiss?.segueIdentifier {
            segueAfterDismiss?.performingViewController.performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
        segueAfterDismiss = nil
    }
    
    func addConstraintsFor(superview: UIView, subview: UIView) {
        let leftConstraint = NSLayoutConstraint(item: superview, attribute: .trailingMargin, relatedBy: .equal, toItem: subview, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: superview, attribute: .leadingMargin, relatedBy: .equal, toItem: subview, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: superview, attribute: .topMargin, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: superview, attribute: .bottomMargin, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1, constant: 200)
        
        superview.addConstraint(leftConstraint)
        superview.addConstraint(rightConstraint)
        superview.addConstraint(topConstraint)
        superview.addConstraint(bottomConstraint)
    }
}
