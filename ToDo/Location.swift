//
//  Location.swift
//  ToDo
//
//  Created by Enjel Hutasoit on 18/05/25.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(
        name: String,
        coordinate: CLLocationCoordinate2D? = nil
    ) {
        self.name = name
        self.coordinate = coordinate
    }
}
