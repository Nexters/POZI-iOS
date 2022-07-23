//
//  Location.swift
//  Pozi
//
//  Created by suding on 2022/07/20.
//

import Foundation

struct Location: Identifiable {
    var id: String
    var address: String
    var brand: String
//  var geopoint: GeoPoint
    var name: String
}

struct GeoPoint {
    var latitude: Double
    var longtitude: Double
}
