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
}

extension CollectionDemoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row % 10 == 5) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Advertisement", for: indexPath)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Content", for: indexPath)
            return cell
        }
    }
}
