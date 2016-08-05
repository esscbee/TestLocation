//
//  ViewController.swift
//  TestLocation
//
//  Created by Stephen Brennan on 8/5/16.
//  Copyright © 2016 Stephen Brennan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    var nolo: NoLocation?

    @IBOutlet weak var label: UILabel!
    var didLoad = false
    let lm = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad = true
        lm.requestWhenInUseAuthorization()
        
    }

    override func viewDidAppear(animated: Bool) {
        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            performSegueWithIdentifier("NoLocation", sender: self)
        }

    }
    
    @IBAction func prepareForUnwind(segue : UIStoryboardSegue) {
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue: \(sender)")
        print("prepareForSegue: \(segue.destinationViewController)")
        if let vc = segue.destinationViewController as? NoLocation {
            nolo = vc
        } else {
            nolo = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func becomingActive() {
        if let no = nolo {
            no.becomingActive()
        }
    }
    


}

