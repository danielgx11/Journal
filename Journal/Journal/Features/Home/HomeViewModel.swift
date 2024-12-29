//
//  HomeViewModel.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation

@MainActor
@Observable
final class HomeViewModel {
    
    // MARK: - PROPERTIES
    
    private var viewEntity: HomeViewEntity?
    private(set) var viewState: HomeViewState = .isLoading(true)
    private let useCase: HomeUseCaseProtocol
    private let database: DatabaseManagerProtocol
    private let factory: HomeViewFactoryProtocol
    
    // MARK: - INITIALIZERS
    
    init(useCase: HomeUseCaseProtocol, database: DatabaseManagerProtocol, factory: HomeViewFactoryProtocol) {
        self.useCase = useCase
        self.database = database
        self.factory = factory
    }
    
}

// MARK: - METHODS

extension HomeViewModel {
    
    func fetchLocation(with entity: UserLocationEntity) {
        Task {
            do {
                let location = try await useCase.fetchLocation()
                let entity = factory.buildUserLocationEntity(with: location)
                viewState = .hasLocation(entity)
            } catch {
                debugPrint(error.localizedDescription)
                // TODO: handle errors
            }
        }
    }
    
    func saveNote(with entity: JournalEntity) {
        database.save(journal: entity)
        saveContext()
    }
    
    func deleteNote(at offsets: IndexSet) {
        database.delete(at: offsets)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try database.saveContext()
        } catch {
            // TODO: show error
            
            debugPrint(error.localizedDescription)
        }
    }
}
