//
//  DatabaseError.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

enum DatabaseError: Error {
    case unknown(message: String)
    case saveContextFailed
    case fetchFailed
    case saveEntityFailed
    case deleteEntityFailed
    
    var localizedDescription: String {
        switch self {
        case let .unknown(message):
            return message
        case .saveContextFailed:
            return ""
        case .fetchFailed:
            return ""
        case .saveEntityFailed:
            return ""
        case .deleteEntityFailed:
            return ""
        }
    }
}
