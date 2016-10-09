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

        advertisementView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        advertisementView.videoURL = "http://hitokuse.com/videos/top-video.mp4"
    }
}

extension ViewController: AdvertisementViewDelegate {
    func onTapAdvertisement() {
        let url = URL(string: "http://hitokuse.com")!
        UIApplication.shared.openURL(url)
    }
}
