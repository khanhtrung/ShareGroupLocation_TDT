//
//  Location.swift
//  ShareGroupLocation
//
//  Created by Khanh Trung on 11/15/16.
//  Copyright © 2016 TRUNG. All rights reserved.
//

import Foundation
import FirebaseDatabase

let LOC_USERS = "users"
let LOC_GROUPS = "groups"

let LOC_LATITUDE = "latitude"
let LOC_LONGTITUDE = "longitude"

class Location {
    private var _locationRef: FIRDatabaseReference!
    
    private(set) var users: [String]!
    private(set) var groups: [String]!
    
    // uid
    private(set) var locationKey: String!
    private(set) var location_Latitude: String!
    private(set) var location_Longitude: String!
    
    init(latitude: String, longitude: String) {
        self.location_Latitude = latitude
        self.location_Longitude = longitude
    }
    
    init(locationKey: String, userData: Dictionary<String, AnyObject>) {
        self.locationKey = locationKey
        
        if let latitude = userData[LOC_LATITUDE] as? String {
            self.location_Latitude = latitude
        }
        
        if let longitude = userData[LOC_LONGTITUDE] as? String {
            self.location_Longitude = longitude
        }
        
        _locationRef = DataService.ds.REF_LOCATIONS.child(locationKey)
    }
}
