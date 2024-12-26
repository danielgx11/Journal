//
//  ServiceManager.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

protocol ServiceManagerProocol {
    func fetch<T: Decodable>(request: ServiceRequest, type: T.Type) async throws -> T
}

final class ServiceManager: ServiceManagerProocol {
    
    func fetch<T>(request: ServiceRequest, type: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: request.url) else {
            throw ServiceError.invalidUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw ServiceError.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}

