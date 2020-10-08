//
//  ShipStationAPI.swift
//  
//
//  Created by Chris Foreman on 8/17/20.
//

import Foundation


open class ShipStationAPI {
    
    //MARK: Private Props
    
    private static var _shared:ShipStationAPI!
    
    private var rootEndPoint:String
    
    private var publicKey:String
    
    private var privateKey:String
    
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
    
    public func listOrders() -> String {
        let endPoint = "\(rootEndPoint)/orders"
        return ""
    }
    
}
