//
//  ViewController.swift
//  CheckAndXHUD
//
//  Created by Vincenzo Favara on 14/10/15.
//  Copyright © 2015 Vincenzo Favara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show what do you want in view
        CheckAndXHUD.showInView(self.view, message: "what I wont", isDone: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showButtonWasTapped() {
        CheckAndXHUD.showCheckInView(self.view)
    }
    
    @IBAction func showWithMessageButtonWasTapped() {
        CheckAndXHUD.showCheckInView(self.view, message: "Done")
    }
    
    @IBAction func showXButtonWasTapped(sender: UIButton) {
        CheckAndXHUD.showXInView(self.view)
    }
    
    @IBAction func showXWithMessageButtonWasTapped(sender: UIButton) {
        CheckAndXHUD.showXInView(self.view, message: "Wrong")
    }

}

