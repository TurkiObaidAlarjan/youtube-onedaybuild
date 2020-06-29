//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Turki Obaid ALarjan on 26/05/2020.
//  Copyright © 2020 Turki Obaid ALarjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ///Model instance
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        model.getVideos()
    }
    
    
}

