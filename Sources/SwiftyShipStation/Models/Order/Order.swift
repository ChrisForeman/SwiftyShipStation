//
//  Order.swift
//  Tucker
//
//  Created by Chris Foreman on 12/24/19.
//  Copyright © 2019 Chris Foreman. All rights reserved.
//

import Foundation

struct Order: Codable {
    
    let orderID: Int
    let orderNumber:String

    let shipByDate: Date?
    let orderStatus: String
    let shipTo: ShipStationCustomerInfo
    let items: [ShipStationItem]
    let orderTotal:Decimal
    let customerNotes, internalNotes: String?
    let paymentMethod:String?
    let requestedShippingService: String?
    let externallyFulfilled: Bool?
    let datePlaced:String
    let customerUsername:String?
    
    enum CodingKeys: String, CodingKey {
        case orderID = "orderId"
        case datePlaced = "orderDate"
        case orderNumber, shipByDate, orderStatus
        case shipTo, items, orderTotal, customerNotes, internalNotes, paymentMethod, requestedShippingService, externallyFulfilled
        case customerUsername
    }
    
}

