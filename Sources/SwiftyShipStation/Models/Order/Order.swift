//
//  Order.swift
//  Tucker
//
//  Created by Chris Foreman on 12/24/19.
//  Copyright © 2019 Chris Foreman. All rights reserved.
//

import Foundation

public struct Order: Codable {
    
    public let orderID: Int
    public let orderNumber:String

    public let shipByDate: Date?
    public let orderStatus: String
    public let shipTo: ShipStationCustomerInfo
    public let items: [ShipStationItem]
    public let orderTotal:Decimal
    public let customerNotes, internalNotes: String?
    public let paymentMethod:String?
    public let requestedShippingService: String?
    public let externallyFulfilled: Bool?
    public let datePlaced:String
    public let customerUsername:String?
    
    enum CodingKeys: String, CodingKey {
        case orderID = "orderId"
        case datePlaced = "orderDate"
        case orderNumber, shipByDate, orderStatus
        case shipTo, items, orderTotal, customerNotes, internalNotes, paymentMethod, requestedShippingService, externallyFulfilled
        case customerUsername
    }
    
}

