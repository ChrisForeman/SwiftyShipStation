//
//  SSOrderLabelResponse.swift
//  TuckeriOS
//
//  Created by Chris Foreman on 1/12/20.
//  Copyright © 2020 Chris Foreman. All rights reserved.
//

import Foundation

public struct ShipmentLabel: Codable {
    
    public let shipmentID:Int
    public let shipmentCost:Decimal
    public let insuranceCost:Decimal
    public let tracking:String
    public let dataString:String
    
    enum CodingKeys:String, CodingKey {
        case shipmentID = "shipmentId"
        case shipmentCost = "shipmentCost"
        case insuranceCost = "insuranceCost"
        case tracking = "trackingNumber"
        case dataString = "labelData"
    }
    
}
