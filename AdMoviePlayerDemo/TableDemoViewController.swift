//
//  TableDemoViewController.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/09.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit

class TableDemoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
}

extension TableDemoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 10 == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Advertisement") as! AdvertisementTableViewCell
            cell.videoURL = "http://hitokuse.com/videos/top-video.mp4"
            cell.advertisementView.delegate = self
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Content")!
            cell.textLabel?.text = "Hello " + String(indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
}

extension TableDemoViewController: AdvertisementViewDelegate {
    func onTapAdvertisement() {
        let url = URL(string: "http://hitokuse.com")!
        UIApplication.shared.openURL(url)
    }
}
