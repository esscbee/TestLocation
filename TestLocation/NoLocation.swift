//
//  NoLocation.swift
//  TestLocation
//
//  Created by Stephen Brennan on 8/5/16.
//  Copyright © 2016 Stephen Brennan. All rights reserved.
//

import UIKit
import MapKit

class NoLocation : UIViewController {
    
    override func viewDidLoad() {
//        becomingActive()
    }
    
    @IBOutlet weak var label: UILabel!
    func becomingActive() {
        var val : String = "None"
        switch(CLLocationManager.authorizationStatus()) {
        case .AuthorizedAlways:
            val = "AuthorizedAlways"
        case .AuthorizedWhenInUse:
            val = "AuthorizedWhenInUse"
        case .Denied:
            val = "Denied"
        case .NotDetermined:
            val = "NotDetermined"
        case .Restricted:
            val = "Restricted"
            
        }
        label.text = val
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            self.performSegueWithIdentifier("unwind", sender: self)
        }
    }
    
}