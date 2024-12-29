//
//  HomeViewFactorySpy.swift
//  Journal
//
//  Created by Daniel Gomes Xavier on 29/12/24.
//

@testable import Journal

final class HomeViewFactorySpy: HomeViewFactoryProtocol {
    
    private(set) var buildEntityCalled = false
    private(set) var buildUserLocationEntityCalled = false
    
    func buildEntity() -> HomeViewEntity {
        buildEntityCalled = true
        
        return HomeViewEntity.init()
    }
    
    func buildUserLocationEntity(with data: LocationData) -> UserLocationEntity {
        buildUserLocationEntityCalled = true
        
        return UserLocationEntity.init(latitude: "", longitude: "")
    }
    
}
