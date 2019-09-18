//
//  ViewController.swift
//  OnsiteWeather
//
//  Created by Naomi Black on 8/28/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var CurrentWeatherView: UIView!
    @IBOutlet weak var FiveDayForecastView: UIView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            CurrentWeatherView.alpha = 1
            FiveDayForecastView.alpha = 0
        } else {
            CurrentWeatherView.alpha = 0
            FiveDayForecastView.alpha = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

