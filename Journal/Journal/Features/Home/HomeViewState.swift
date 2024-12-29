//
//  HomeViewState.swift
//  Journal
//
//  Created by Daniel Gomes Xavier on 28/12/24.
//

import Foundation

enum HomeViewState {
    case isLoading(Bool)
    case hasData(HomeViewEntity)
    case hasLocation(UserLocationEntity)
    case hasError
}
