//
//  File.swift
//  
//
//  Created by Chris Foreman on 10/8/20.
//

import Foundation

extension Order {
    
struct ShipStationCustomerInfo: Codable {
    
    let name:String
    let company: String?
    let street1, street2: String?
    let street3: String?
    let city, state, postalCode, country: String?
    let phone: String?
    let residential: Bool?
    let addressVerified: String?
}
    
}
