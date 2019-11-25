//
//  Equipment.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation

// Json - Each Equipment
struct EachEquipment: Decodable {
    var id: Int
    var vin: String
    var year: Int
    var make: String
    var value: Double
    var length: Double
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case vin = "vin"
        case year = "year"
        case make = "make"
        case value = "value"
        case length = "length"
    }
}
