//
//  AdvertisementTableViewCell.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/09.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit

class AdvertisementTableViewCell: UITableViewCell {
    @IBOutlet var advertisementView: AdvertisementView!
    var redirectURL: String? {
        set {
            advertisementView.redirectURLString = newValue
        }
        get {
            return advertisementView.redirectURLString
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func playAdvertisement(urlString:String) {
        advertisementView.playAdvertisement(urlString: urlString)
    }
    
    
}
