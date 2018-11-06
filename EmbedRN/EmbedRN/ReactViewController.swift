//
//  ReactViewController.swift
//  EmbedRN
//
//  Created by Asia Mac on 11/4/18.
//  Copyright © 2018 Asia. All rights reserved.
//

import UIKit
import React

class ReactViewController: UIViewController {

    @IBOutlet weak var embedViewController: embedViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.highScoreButtonTapped()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "embed" , let destination = segue.destination as? embedViewController {
            self.embedViewController = destination
        }
    }
 

    
    @IBAction func highScoreButtonTapped() {
        NSLog("Hello")
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "RNHighScores",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
       self.embedViewController?.view = rootView
    }
}
