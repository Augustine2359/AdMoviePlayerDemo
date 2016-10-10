//
//  CollectionDemoViewController.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/09.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit

class CollectionDemoViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
    }
}

extension CollectionDemoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
}

extension CollectionDemoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row % 5 == 3) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Advertisement", for: indexPath) as? AdvertisementCollectionViewCell {
                cell.mediaURL = "http://hitokuse.com/videos/top-video.mp4"
                cell.advertisementView.delegate = self
                return cell
            }

            let cell = AdvertisementCollectionViewCell(frame: .zero)
            cell.mediaURL = "http://hitokuse.com/videos/top-video.mp4"
            cell.advertisementView.delegate = self
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Content", for: indexPath)
            return cell
        }
    }
}

extension CollectionDemoViewController: AdvertisementViewDelegate {
    func onTapAdvertisement() {
        let url = URL(string: "http://hitokuse.com")!
        UIApplication.shared.openURL(url)
    }
}
