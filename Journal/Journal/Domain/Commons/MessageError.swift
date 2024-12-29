//
//  MessageError.swift
//  Journal
//
//  Created by Daniel Gomes Xavier on 29/12/24.
//


enum MessageError: Error {
    case `default`
    
    var localizedDescription: String {
        switch self {
        case .default:
            return "Throws the default error message"
        }
    }
}