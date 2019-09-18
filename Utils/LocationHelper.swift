//
//  LocationHelper.swift
//  OnsiteWeather
//
//  Created by Black, Noami on 8/28/19.
//  Copyright © 2019 Naomi Black. All rights reserved.
//

import Foundation
import CoreLocation

public class LocationHelper: NSObject, CLLocationManagerDelegate {
    
    var longitude : Double = 0
    var latitude : Double = 0
    var locationmanager : CLLocationManager?
    var location : CoordinateLocation?
    
    public static let sharedInstance : LocationHelper = {
        let instance = LocationHelper()
        return instance
    }()
    
    public override init()
    {
        super.init()
        setup()
    }
    
    func setup()
    {
        if (self.locationmanager == nil) {
            DispatchQueue.main.async {
                self.locationmanager = CLLocationManager()
                
                if CLLocationManager.locationServicesEnabled() {
                    if let locManager = self.locationmanager {
                        locManager.delegate = self
                        locManager.desiredAccuracy = kCLLocationAccuracyKilometer
                        locManager.allowsBackgroundLocationUpdates = false
                        locManager.activityType = .otherNavigation
                    }
                }
            }
        }
    }
    
    func start() {
        if let locManager = self.locationmanager {
            locManager.startMonitoringSignificantLocationChanges()
        }
    }
    
    func stop() {
        if let locManager = locationmanager {
            locManager.stopMonitoringSignificantLocationChanges()
        }
    }
    
    func requestLocation() {
        if let locManager = self.locationmanager {
            locManager.requestLocation()
        }
    }
    
    public func pingLocation() {
        self.locationmanager?.requestLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        //location services are ON!
//        print("updating location")
        
        if let location = locations.last {
            let locValue:CLLocationCoordinate2D = location.coordinate
            latitude = Double(locValue.latitude).roundTo(places: 2)
            longitude = Double(locValue.longitude).roundTo(places: 2)
            print("\tlatitude: \(latitude)")
            print("\tlongitude: \(longitude)")
            
            var locationStruct = CoordinateLocation()
            locationStruct.lat = latitude
            locationStruct.long = longitude

            
//            print("sending location")
            //send coordinates
            self.location = locationStruct
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateLocation"), object: self.location)
            //            }
            
        } else {
            print("no coordinates provided")
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location manager failed, error = \(error.localizedDescription)")
        //else, ping location called from app delegate before user is signed in for the first time!
        
    }
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
            // If always authorized
            manager.startUpdatingLocation()
            break
        case .restricted:
            // If restricted. User can't enable Location Services
            break
        case .denied:
            // If user denied your app access to Location Services, but can grant access from Settings.app
            break
        }
    }
    
}


