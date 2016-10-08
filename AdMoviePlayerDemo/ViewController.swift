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
    var advertisementView: AdvertisementView

    required init?(coder aDecoder: NSCoder) {
        advertisementView = AdvertisementView(videoURL: "http://hitokuse.com/videos/top-video.mp4")
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
        view.addSubview(advertisementView)
        addConstraintsToadvertisementView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addConstraintsToadvertisementView() {
        let leftConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: advertisementView, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: advertisementView, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: topLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: advertisementView, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: advertisementView, attribute: .height, multiplier: 2, constant: 0)
        
        view.addConstraint(leftConstraint)
        view.addConstraint(rightConstraint)
        view.addConstraint(heightConstraint)
        view.addConstraint(topConstraint)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        advertisementView.advertisementPlay()
    }
}
