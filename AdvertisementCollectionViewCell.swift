//
//  AdvertisementCollectionViewCell.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/10.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit

class AdvertisementCollectionViewCell: UICollectionViewCell {
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
        if (advertisementView == nil) {
            advertisementView = AdvertisementView()
            advertisementView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(advertisementView)
            addConstraintsFor(subview: advertisementView)
        }
        print(advertisementView)
    }

    override init(frame: CGRect) {
        advertisementView = AdvertisementView()
        advertisementView.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        addSubview(advertisementView)
        addConstraintsFor(subview: advertisementView)
    }
    
    func playAdvertisement(urlString:String) {
        advertisementView.playAdvertisement(urlString: urlString)
    }
    
    func addConstraintsFor(subview: UIView) {
        let leftConstraint = NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: subview, attribute: .trailing, multiplier: 1, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: subview, attribute: .leading, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: subview, attribute: .height, multiplier: 1, constant: 0)
        
        addConstraint(leftConstraint)
        addConstraint(rightConstraint)
        addConstraint(heightConstraint)
        addConstraint(topConstraint)
    }
}
