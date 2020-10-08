//
//  File.swift
//  
//
//  Created by Chris Foreman on 10/8/20.
//

import Foundation

extension Order {
    
public struct ShipStationCustomerInfo: Codable {
    
    public let name:String
    public let company: String?
    public let street1, street2: String?
    public let street3: String?
    public let city, state, postalCode, country: String?
    public let phone: String?
    public let residential: Bool?
    public let addressVerified: String?
}
    
}
