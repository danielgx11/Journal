//
//  HomeViewFactory.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

protocol HomeViewFactoryProtocol {
    func buildEntity() -> HomeViewEntity
}

struct HomeViewFactory: HomeViewFactoryProtocol {
    
    func buildEntity() -> HomeViewEntity {
        HomeViewEntity()
    }
}
