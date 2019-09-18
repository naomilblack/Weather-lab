//
//  FiveDayForecast.swift
//  OnsiteWeather
//
//  Created by Black, Noami on 8/29/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import UIKit
import Alamofire

class FiveDayForecastViewController: UIViewController {
    
//   var forecastDataSource: [Weather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationHelper.sharedInstance.start()
        //self.currentLocation.text = ""
       // self.currentTemp.text = ""
        // Do any additional setup after loading the view.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: date!)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //let weatherObject = forecastData[indexPath.section]
        
//        cell.textLabel?.text = weatherObject.summary
//        cell.detailTextLabel?.text = "\(Int(weatherObject.temperature)) °F"
//        cell.imageView?.image = UIImage(named: weatherObject.icon)
//        
        return cell
    }


}
