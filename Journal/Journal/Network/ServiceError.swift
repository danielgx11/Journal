//
//  ServiceError.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case invalidUrl
    case invalidStatusCode
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return "Unknown error"
        case .invalidUrl:
            return "Invalid URL, try again!"
        case .invalidStatusCode:
            return "Invalid status code"
        }
    }
}
