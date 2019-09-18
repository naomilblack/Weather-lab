//
//  Weather.swift
//  OnsiteWeather
//
//  Created by Black, Noami on 8/28/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import Foundation


struct CurrentWeatherData: Codable {
    
    
    let coord: Coordinates?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Double?
    let sys: Sys?
    let cityId: Int?
    let cityName: String?
    let statusCode: Int?
    let list : [ListFive]?
    
    public struct Weather: Codable {
        let id: Int?
        let main: String?
        let description: String?
        let icon: String?
    }
    
  public struct Coordinates: Codable {
        let lon: Double?
        let lat: Double?
    }
    
    struct Main: Codable {
        let temp: Double?
        let pressure: Int?
        let humidity: Int?
        let tempMin: Double?
        let tempMax: Double?
        
    }
    
    struct Wind: Codable {
        let speed: Double?
        let deg: Int?
    }
    
    struct Clouds: Codable {
        let all: Int?
    }
    
    struct Sys: Codable {
        let type: Int?
        let id: Int?
        let message: Double?
        let country: String?
        let sunrise: Int?
        let sunset: Int?
    }
    
    struct ListFive : Codable {
        let dt : Float?
        let main : Main?
        let weather : [Weather]?
        let clouds: Clouds?
        let wind: Wind?
        let dt_txt: String
    }
    
        enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case dt
        case sys
        case cityId = "id"
        case cityName = "name"
        case statusCode = "cod"
        case list
    }
    
}


//extension WeatherInfo: Codable {
//    var iconUrlPath: String {
//        guard let iconName = weather.first?.icon else { return "" }
//        return "https://openweathermap.org/img/w/\(iconName).png"
//}
//}
