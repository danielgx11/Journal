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
    private let service: ServiceManagerProocol
    private let database: DatabaseManagerProtocol
    private let factory: HomeViewFactoryProtocol
    
    // MARK: - INITIALIZERS
    
    init(service: ServiceManagerProocol, database: DatabaseManagerProtocol, factory: HomeViewFactoryProtocol) {
        self.service = service
        self.database = database
        self.factory = factory
    }
    
}

// MARK: - METHODS

extension HomeViewModel {
    
    func fetchLocation(with entity: UserLocationEntity) {
        // TODO: make request
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
