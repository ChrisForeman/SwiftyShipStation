//
//  SSOrderLabelResponse.swift
//  TuckeriOS
//
//  Created by Chris Foreman on 1/12/20.
//  Copyright © 2020 Chris Foreman. All rights reserved.
//

import Foundation

struct ShipmentLabel: Codable {
    
    let shipmentID:Int
    let shipmentCost:Decimal
    let insuranceCost:Decimal
    let tracking:String
    let dataString:String
    
    enum CodingKeys:String, CodingKey {
        case shipmentID = "shipmentId"
        case shipmentCost = "shipmentCost"
        case insuranceCost = "insuranceCost"
        case tracking = "trackingNumber"
        case dataString = "labelData"
    }
    
}
