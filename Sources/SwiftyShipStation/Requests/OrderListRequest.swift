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
    
    public enum OrderStatus:String {
        case awaitPayment = "awaiting_payment"
        case awaitShipment = "awaiting_shipment"
        case pending = "pending_fulfillment"
        case shipped
        case onHold = "on_hold"
        case cancelled
    }
    
    public enum SortOption:String {
        case orderDate = "OrderDate"
        case modifyDate = "ModifyDate"
        case createDate = "CreateDate"
    }
    
    public enum SortOrder:String {
        case ascending = "ASC"
        case descending = "DESC"
    }
    
    public init(endPoint: String, headers: [String:String]?) {
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
    public func customerName(_ value: String) -> OrderListRequest {
        return addParam(name: "customerName", value: value)
    }
    
    
    ///Returns orders that contain items that match the specified keyword. Fields searched are Sku, Description, and Options
    public func itemKeyword(_ value: String) -> OrderListRequest {
        return addParam(name: "itemKeyword", value: value)
    }
    
    ///Returns orders that were created in ShipStation after the specified date
    public func createDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "createDateStart", value: dateString)
    }
    
    ///Returns orders that were created in ShipStation before the specified date
    public func createDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "createDateEnd", value: dateString)
    }
    
    
    ///Returns orders that were modified after the specified date
    public func modifyDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "modifyDateStart", value: dateString)
    }
    
    
    ///Returns orders that were modified before the specified date
    public func modifyDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "modifyDateEnd", value: dateString)
    }
    
    ///Returns orders greater than the specified date
    public func orderDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "orderDateStart", value: dateString)
    }
    
    ///Returns orders less than or equal to the specified date Example
    public func orderDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "orderDateEnd", value: dateString)
    }
    
    ///Filter by order number, performs a "starts with" search.
    public func orderNumber(_ value: String) -> OrderListRequest {
        return addParam(name: "orderNumber", value: value)
    }
    
    ///Filter by order status. If left empty, orders of all statuses are returned.
    public func orderStatus(_ value: OrderStatus) -> OrderListRequest {
        return addParam(name: "orderStatus", value: value.rawValue)
    }
    
    ///Returns orders that were paid after the specified date
    public func paymentDateStart(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "paymentDateStart", value: dateString)
    }
    
    ///Returns orders that were paid before the specified date
    public func paymentDateEnd(_ date: Date) -> OrderListRequest {
        let dateString = stringFor(date)
        return addParam(name: "paymentDateEnd", value: dateString)
    }
    
    ///Filters orders to a single store. Call List Stores to obtain a list of store Ids.
    public func storeID(_ value: Int) -> OrderListRequest {
        return addParam(name: "storeid", value: "\(value)")
    }
    
    ///Sort the responses by a set value. The response will be sorted based off the ascending dates (oldest to most current.) If left empty, the response will be sorted by ascending orderId.
    public func sortBy(_ value: String) -> OrderListRequest {
        return addParam(name: "sortBy", value: value)
    }
    
    ///Sets the direction of the sort order.
    public func sortDirection(_ value: String) -> OrderListRequest {
        return addParam(name: "sortDir", value: value)
    }

    ///Page number Default: 1.
    public func page(_ value: String) -> OrderListRequest {
        return addParam(name: "page", value: value)
    }
    
    ///Requested page size. Max value is 500. Default: 100.
    public func pageSize(_ value: Int) -> OrderListRequest {
        let stringValue = String(min(500, value))
        return addParam(name: "pageSize", value: stringValue)
    }
    
    
}
