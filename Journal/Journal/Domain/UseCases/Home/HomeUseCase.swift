//
//  HomeUseCase.swift
//  Journal
//
//  Created by Daniel Gomes Xavier on 28/12/24.
//

import Foundation

protocol HomeUseCaseProtocol {
    func fetchLocation() async throws -> LocationData
}

final class HomeUseCase {
    
    let service: ServiceManagerProtocol
    
    init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension HomeUseCase: HomeUseCaseProtocol {
    
    func fetchLocation() async throws -> LocationData {
        try await service.fetch(request: .getWeather, type: LocationData.self)
    }
}
