//
//  File.swift
//  
//
//  Created by Chris Foreman on 10/8/20.
//

import Foundation

struct OrdersListResponse:Codable {
    
    let orders:[Order]
    let total:Int
    let page:Int
    let pages:Int
    
}
