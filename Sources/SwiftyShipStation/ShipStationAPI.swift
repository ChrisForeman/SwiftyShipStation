//
//  ShipStationAPI.swift
//  
//
//  Created by Chris Foreman on 8/17/20.
//

import Foundation


open class ShipStationAPI {
    
    //MARK: Private Props
    
    #warning("TODO: Remove public shared and keep it internal. Then calls to the API won't include .shared for better code semantics.")
    private static var _shared:ShipStationAPI!
    
    private var rootEndPoint:String
    
    private var publicKey:String
    
    private var privateKey:String
    
    private var authHeader:[String:String] {
        return ["Authorization":"Basic \(credentials)"]
    }
    
    private var credentials:String {
        guard let credentialData = "\(publicKey):\(privateKey)".data(using: String.Encoding.utf8) else { return "" }
        return credentialData.base64EncodedString(options: [])
    }
    
    
    //MARK: Public Props
    
    public static var shared:ShipStationAPI {
        get {
            if _shared == nil {
                fatalError("Error: The \"ShipStation.configure()\" method must be called before the API can be used.")
            }
            return _shared
        }
    }
    
    //MARK: Setup
    
    private init(publicKey:String, privateKey:String, rootEndPoint:String = "https://ssapi.shipstation.com") {
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.rootEndPoint = rootEndPoint
    }
    
    public static func configure(publicKey:String, privateKey:String) {
        _shared = ShipStationAPI(
            publicKey: publicKey,
            privateKey: privateKey
        )
    }
    
    //MARK: API Call Methods
    
    public func listOrders() -> OrderListRequest {
        let endPoint = "\(rootEndPoint)/orders"
        let request = OrderListRequest(endPoint: endPoint, headers: authHeader)
        return request
    }
    
    ///New label request with all required parameters
    public func createLabel(orderID: Int, carrierCode: ShipmentLabelRequest.Carrier? = nil, serviceCode: ShipmentLabelRequest.ServiceCode? = nil, confirmation: ShipmentLabelRequest.Confirmation? = nil, shipDate: Date, testLabel: Bool) -> ShipmentLabelRequest {
        let endpoint = "\(rootEndPoint)/orders/createlabelfororder"
        
        var headers = authHeader
        headers["Content-Type"] = "application/json"
        
        let request = ShipmentLabelRequest(endPoint: endpoint, headers: headers, orderID: orderID, carrierCode: carrierCode, serviceCode: serviceCode, confirmation: confirmation, shipDate: shipDate, testLabel: testLabel)
        return request
    }
    
}
