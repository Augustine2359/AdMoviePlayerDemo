//
//  NavigationDemoViewControllerOne.swift
//  AdMoviePlayerDemo
//
//  Created by Augustine Cheong on 2016/10/10.
//  Copyright © 2016 Augustine Cheong. All rights reserved.
//

import Foundation
import UIKit

class NavigationDemoViewControllerOne: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    var seguesPerformed = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func onTap(sender: UIButton) {
        seguesPerformed += 1
        performSegue(withIdentifier: "NavigationDemoSegue", sender: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = String(seguesPerformed) + " segues performed"
    }
}
