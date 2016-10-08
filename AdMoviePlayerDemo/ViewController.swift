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
    @IBOutlet var advertisementView: AdvertisementView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
        advertisementView.playAdvertisement(urlString: "http://hitokuse.com/videos/top-video.mp4")
        advertisementView.redirectURLString = "http://hitokuse.com"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
