//
//  Location.swift
//  OnsiteWeather
//
//  Created by Black, Noami on 8/30/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import Foundation

public struct CoordinateLocation : Codable {
    var lat : Double? = nil
    var long : Double? = nil
}

enum RequestReply {
    case Success
    case Failure
}

let OPEN_WEATHER_MAP_API_KEY = "52c165ad130a98adf2a3fdf2cde5d4fd"
let OPEN_WEATHER_MAP_URL = "https://api.openweathermap.org/data/2.5"

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Date {
    
    func DateToString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        //        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
    
}
