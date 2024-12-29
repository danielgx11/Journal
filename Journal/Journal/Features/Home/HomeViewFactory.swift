//
//  HomeViewFactory.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

protocol HomeViewFactoryProtocol {
    func buildEntity() -> HomeViewEntity
    func buildUserLocationEntity(with data: LocationData) -> UserLocationEntity
}

struct HomeViewFactory: HomeViewFactoryProtocol {
    
    func buildEntity() -> HomeViewEntity {
        HomeViewEntity()
    }
    
    func buildUserLocationEntity(with data: LocationData) -> UserLocationEntity {
        UserLocationEntity(latitude: data.latitude, longitude: data.longitude)
    }
    
}
