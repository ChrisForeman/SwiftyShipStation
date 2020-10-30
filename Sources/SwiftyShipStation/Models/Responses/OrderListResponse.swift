//
//  File.swift
//  
//
//  Created by Chris Foreman on 10/8/20.
//

import Foundation

public struct OrdersListResponse:Codable {
    
    public let orders:[Order]
    public let total:Int
    public let page:Int
    public let pages:Int
    
}
