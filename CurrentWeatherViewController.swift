//
//  CurrentWeather.swift
//  OnsiteWeather
//
//  Created by Black, Noami on 8/29/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var currentLocation: UILabel!

    @IBOutlet weak var currentTemp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        LocationHelper.sharedInstance.start()
        
        self.currentLocation.text = ""
        self.currentTemp.text = ""
        
        //Get current location
        NotificationCenter.default.addObserver(self, selector: #selector(updateLocation(_:)), name: NSNotification.Name(rawValue: "updateLocation"), object: nil)
    }
    
    @objc func updateLocation(_ notification: Notification) {
        WeatherHelper.sharedInstance.getCurrentWeather { (response, result) in
            
            if response == RequestReply.Success {
                self.currentLocation.text = result.first?.cityName
                
                if let temp = result.first?.main?.temp {
                    self.currentTemp.text = "\(Int(temp)) °F"
                }
                
            } else if response == RequestReply.Failure {
                print("Error")
            }
        }
    }
    }
    




