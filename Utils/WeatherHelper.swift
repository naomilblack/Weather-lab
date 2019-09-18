//
//  DataHelper.swift
//  OnsiteWeather
//
//  Created by Black, Noami on 8/30/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import Foundation
import Alamofire

class WeatherHelper {
    
    public static let sharedInstance : WeatherHelper = {
        let instance = WeatherHelper()
        return instance
    }()
    
    //get current weather conditions
    public func getCurrentWeather(completion: @escaping (RequestReply, [CurrentWeatherData]) -> Void ) {
        if let location = LocationHelper.sharedInstance.location {
            
            //get location coordinates
            if let lat = location.lat,
                let long = location.long,
                lat != 0.0,
                long != 0.0 {
                
                //set param data
                let parameters: Parameters = [
                    "lat": "\(lat)",
                    "lon": "\(long)",
                    "APPID" : "\(OPEN_WEATHER_MAP_API_KEY)",
                    "units" : "imperial" // get Fahrenheit
                ]
                
                Alamofire.request(OPEN_WEATHER_MAP_URL + "/weather", method: .get, parameters: parameters)
                    .responseJSON { response in
                        if response.result.isSuccess {
                            guard let data = response.data else {
                                completion(RequestReply.Failure, [])
                                return
                            }
                            
                            do {
                                let day = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                                completion(RequestReply.Success, [day])
                            } catch let jsonErr {
                                print("Error decoding: \(jsonErr)")
                                completion(RequestReply.Failure, [])
                            }
                        } else {
                            completion(RequestReply.Failure, [])
                        }
                }
            } else {
                completion(RequestReply.Failure, [])
            }
        } else {
            completion(RequestReply.Failure, [])
        }
}
    // get five day weahter forecast
    public func getFiveDayForecast(completion: @escaping (RequestReply, [CurrentWeatherData]) -> Void ) {
        if let location = LocationHelper.sharedInstance.location {
            
            // get location coordinates
            if let lat = location.lat,
                let long = location.long,
                lat != 0.0,
                long != 0.0 {
                
                // set param data
                let parameters: Parameters = [
                    "lat": "\(lat)",
                    "lon": "\(long)",
                    "APPID" : "\(OPEN_WEATHER_MAP_API_KEY)",
                    "units" : "imperial" // get Fahrenheit
                ]
                
                Alamofire.request(OPEN_WEATHER_MAP_URL + "/forecast", method: .get, parameters: parameters)
                    .responseJSON { response in
                        if response.result.isSuccess {
                            
                            guard let data = response.data else {
                                completion(RequestReply.Failure, [])
                                return
                            }
                            
                            do {
                                let days = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                                
                                completion(RequestReply.Success, [days])
                            } catch let jsonErr {
                                print("Error decoding: \(jsonErr)")
                                completion(RequestReply.Failure, [])
                            }
                            
                        } else {
                            completion(RequestReply.Failure, [])
                        }
                }
            } else {
                completion(RequestReply.Failure, [])
            }
        } else {
            completion(RequestReply.Failure, [])
        }
    }
}
