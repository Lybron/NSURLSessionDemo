//
//  ViewController.swift
//  NSURLSessionDemo
//
//  Created by Lybron Sobers on 1/6/16.
//  Copyright © 2016 Lybron Sobers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Instantiate the NetworkManager class
        // Set the view controller as its delegate
        // Perform request to get weather info
        
        let manager = NetworkManager()
        manager.delegate = self
        manager.getWeatherInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didReceiveResponse(info: [String : AnyObject]) {
        
        // Read "name" property from info dictionary
        let name = info["name"]
        print("Name: \(name)")
        
        // The main property is a dictionary within the returned JSON object
        // We can access the embedded dictionary as follows
        
        let main = info["main"]
        print("Humidity: \(main!["humidity"])")
    }
    
    func didFailToReceieveResponse() {
        print("there was an error")
    }

}

