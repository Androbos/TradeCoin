//
//  NavigationTableViewController.swift
//  TradeCoin
//
//  Created by otto on 7/1/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import UIKit

class NavigationTableViewController: UITableViewController {

    @IBOutlet weak var depositImg: UIImageView!
    @IBOutlet weak var transferImg: UIImageView!
    @IBOutlet weak var settingsImg: UIImageView!
    @IBOutlet weak var helpImg: UIImageView!
    
    fileprivate func setupView() {
        depositImg.tintImageColor(color: GREEN)
        transferImg.tintImageColor(color: GREEN)
        settingsImg.tintImageColor(color: GREEN)
        helpImg.tintImageColor(color: GREEN)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
