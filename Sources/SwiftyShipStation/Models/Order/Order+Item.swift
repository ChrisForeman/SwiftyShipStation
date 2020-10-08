//
//  File.swift
//  
//
//  Created by Chris Foreman on 10/8/20.
//

import Foundation

extension Order {
    
public struct ShipStationItem: Codable {
    
    public let sku: String
    public let name: String
    public let quantity:Int
    public let unitPrice: Decimal
    
    enum CodingKeys: String, CodingKey {
        case sku, name
        case quantity
        case unitPrice
    }
    
}
    
}
