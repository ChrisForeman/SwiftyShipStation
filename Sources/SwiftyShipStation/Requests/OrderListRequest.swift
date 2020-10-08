//
//  OrderListRequest.swift
//  Tucker
//
//  Created by Chris Foreman on 12/27/19.
//  Copyright © 2019 Chris Foreman. All rights reserved.
//

import Foundation

public struct OrderListRequest:RestAPIRequest {
    
    public typealias ResponseType = OrdersListResponse
    
    public var headers: [String : String]?
    
    public var parameters: [String : String]?
    
    public var endPoint: String
    
    public var body: Data?
    
    public var method: HTTPMethod
    
    enum OrderStatus:String {
        case awaitPayment = "awaiting_payment"
        case awaitShipment = "awaiting_shipment"
        case pending = "pending_fulfillment"
        case shipped
        case onHold = "on_hold"
        case cancelled
    }
    
    enum SortOption:String {
        case orderDate = "OrderDate"
        case modifyDate = "ModifyDate"
        case createDate = "CreateDate"
    }
    
    enum SortOrder:String {
        case ascending = "ASC"
        case descending = "DESC"
    }
    
    init(endPoint: String, headers: [String:String]?) {
        self.endPoint = endPoint
        self.headers = headers
        self.method = .get
        self.parameters = [:]
    }
    
    private func stringFor(_ date: Date) -> String {
        let formatter = DateFormatter()
        //Date format that ShipStation uses
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    ///Returns orders that match the specified name
    mutating func customerName(_ value: String) -> OrderListRequest {
        return addParam(name: "customerName", value: value)
    }
    
    
    ///Returns orders that contain items that match the specified keyword. Fields searched are Sku, Description, and Options
    mutating func itemKeyword(_ value: String) -> OrderListRequest {
        return addParam(name: "itemKeyword", value: value)
    }
    
    ///Returns orders that were created in ShipStation after the specified date
    mutating func createDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "createDateStart", value: dateString)
    }
    
    ///Returns orders that were created in ShipStation before the specified date
    mutating func createDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "createDateEnd", value: dateString)
    }
    
    
    ///Returns orders that were modified after the specified date
    mutating func modifyDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "modifyDateStart", value: dateString)
    }
    
    
    ///Returns orders that were modified before the specified date
    mutating func modifyDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "modifyDateEnd", value: dateString)
    }
    
    ///Returns orders greater than the specified date
    mutating func orderDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "orderDateStart", value: dateString)
    }
    
    ///Returns orders less than or equal to the specified date Example
    mutating func orderDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "orderDateEnd", value: dateString)
    }
    
    ///Filter by order number, performs a "starts with" search.
    mutating func orderNumber(_ value: String) -> OrderListRequest {
        return addParam(name: "orderNumber", value: value)
    }
    
    ///Filter by order status. If left empty, orders of all statuses are returned.
    mutating func orderStatus(_ value: OrderStatus) -> OrderListRequest {
        return addParam(name: "orderStatus", value: value.rawValue)
    }
    
    ///Returns orders that were paid after the specified date
    mutating func paymentDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "paymentDateStart", value: dateString)
    }
    
    ///Returns orders that were paid before the specified date
    mutating func paymentDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "paymentDateEnd", value: dateString)
    }
    
    ///Filters orders to a single store. Call List Stores to obtain a list of store Ids.
    mutating func storeID(_ value: Int) -> OrderListRequest {
        return addParam(name: "storeid", value: "\(value)")
    }
    
    ///Sort the responses by a set value. The response will be sorted based off the ascending dates (oldest to most current.) If left empty, the response will be sorted by ascending orderId.
    mutating func sortBy(_ value: String) -> OrderListRequest {
        return addParam(name: "sortBy", value: value)
    }
    
    ///Sets the direction of the sort order.
    mutating func sortDirection(_ value: String) -> OrderListRequest {
        return addParam(name: "sortDir", value: value)
    }

    ///Page number Default: 1.
    mutating func page(_ value: String) -> OrderListRequest {
        return addParam(name: "page", value: value)
    }
    
    ///Requested page size. Max value is 500. Default: 100.
    mutating func pageSize(_ value: Int) -> OrderListRequest {
        let stringValue = String(min(500, value))
        return addParam(name: "pageSize", value: stringValue)
    }
    
    
}
