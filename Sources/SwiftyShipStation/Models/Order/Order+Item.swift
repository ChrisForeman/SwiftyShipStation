//
//  File.swift
//  
//
//  Created by Chris Foreman on 10/8/20.
//

import Foundation

extension Order {
    
struct ShipStationItem: Codable {
    
    let sku: String
    let name: String
    let quantity:Int
    let unitPrice: Decimal
    
    enum CodingKeys: String, CodingKey {
        case sku, name
        case quantity
        case unitPrice
    }
    
}
    
}
