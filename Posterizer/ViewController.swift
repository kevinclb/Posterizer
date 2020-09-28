//
//  ViewController.swift
//  Posterizer
//
//  Created by Kevin Babou on 9/26/20.
//  Copyright © 2020 Kevin Babou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        RunLoop.current.run(until: NSDate(timeIntervalSinceNow:25) as Date)

        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

