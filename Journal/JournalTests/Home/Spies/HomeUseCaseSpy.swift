//
//  HomeUseCaseSpy.swift
//  JournalTests
//
//  Created by Daniel Gomes Xavier on 28/12/24.
//

import Foundation

@testable import Journal

final class HomeUseCaseSpy: HomeUseCaseProtocol {
    
    var shouldThrowError = false
    
    private(set) var fetchLocationCalled = false
    
    func fetchLocation() async throws -> LocationData {
        fetchLocationCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return LocationData.emptyData
    }
    
}

extension LocationData {
    
    static var emptyData: LocationData {
        LocationData(latitude: "", longitude: "")
    }
}
