//
//  ServiceRequest.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

enum ServiceRequest {
    
    case getWeather
    
    var url: String {
        switch self {
        case .getWeather:
            return ""
        }
    }
    
    var method: String {
        switch self {
        case .getWeather:
            return "GET"
        }
    }
}
