//
//  Restroom.swift
//  iOS Dev MapKit
//
//  Created by Jose Vargas on 1/13/24.
//

import Foundation
import MapKit

struct Restroom: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
