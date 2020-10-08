//
//  SSCreateOrderLabelRequest.swift
//  TuckeriOS
//
//  Created by Chris Foreman on 1/12/20.
//  Copyright © 2020 Chris Foreman. All rights reserved.
//

import Foundation

public struct ShipmentLabelRequest:RestAPIRequest {
    
    typealias ResponseType = ShipmentLabel
    
    var headers: [String : String]?
    
    var parameters: [String : String]?
    
    var endPoint: String
    
    var body: Data?
    
    var method: HTTPMethod
    
    public enum Confirmation:String {
        case none = "none"
        case delivery = "delivery"
        case signature = "signature"
        case adultSignature = "adult_signature"
        case directSignature = "direct_signature"
    }
    
    public enum Carrier:String {
        case usps = "stamps_com"
    }
    
    public enum ServiceCode:String {
        case firstClassMail = "usps_first_class_mail"
    }
    
    private func stringFor(_ date: Date) -> String {
        let formatter = DateFormatter()
        //Date format that ShipStation uses
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    
    //Optional carrier, service, and confirmation codes which will leave them unchanged in case they are already setup ahead of time in ShipStation rules.
    init(endPoint: String, headers: [String:String], orderID: Int, carrierCode: Carrier? = nil, serviceCode: ServiceCode? = nil, confirmation: Confirmation? = nil, shipDate: Date, testLabel: Bool) {
        self.endPoint = endPoint
        self.headers = headers
        self.method = .post
        
        var dataDict:[String:Any] = [
            "orderId": orderID,
            "shipDate": stringFor(shipDate),
            "testLabel": false
        ]
        //Optional, so setting them here to silence warning.
        dataDict["carrierCode"] = carrierCode?.rawValue
        dataDict["serviceCode"] = serviceCode?.rawValue
        dataDict["confirmation"] = confirmation?.rawValue
        
        self.setBody(with: dataDict)
    }

}
