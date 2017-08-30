//
//  Models.swift
//  nycTrees
//
//  Created by Mason Macias on 8/23/17.
//  Copyright © 2017 griffinmacias. All rights reserved.
//

import Foundation

struct Tree {
    let name: String
    let longitude: Double
    let latitude: Double
    
    init?(json: Any) {
        
        guard let json = json as? [String: Any],
                let commonName = json["spc_common"] as? String,
                let latitudeString = json["latitude"] as? String,
                let longitudeString = json["longitude"] as? String,
                let latitude = Double(latitudeString),
                let longitude = Double(longitudeString) else { return nil }
        
        self.name = commonName
        self.latitude = latitude
        self.longitude = longitude
    }
}

