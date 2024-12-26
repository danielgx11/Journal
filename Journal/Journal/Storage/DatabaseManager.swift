//
//  DatabaseManager.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation
import CoreData

protocol DatabaseManagerProtocol {
    
    func fetchItems() throws -> [JournalData]
    func fetchItem(with id: NSManagedObjectID) throws -> JournalData?
    func save(journal: JournalEntity)
    func delete(at offsets: IndexSet)
    func saveContext() throws
}

final class DatabaseManager {
    
    // MARK: - PROPERTIES
    
    private let context: NSManagedObjectContext
    
    // MARK: - INITIALIZERS
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

// MARK: - DatabaseManagerProtocol

extension DatabaseManager: DatabaseManagerProtocol {
    
    func fetchItems() throws -> [JournalData] {
        [JournalData]()
    }
    
    func fetchItem(with id: NSManagedObjectID) throws -> JournalData? {
        do {
            return try context.existingObject(with: id) as? JournalData
        } catch {
            throw DatabaseError.fetchFailed
        }
    }
    
    func save(journal: JournalEntity) {
        let journalData = JournalData(context: context)
        journalData.title = journal.title
        journalData.note = journal.note
        journalData.timestamp = journal.timestamp
    }
    
    func delete(at offsets: IndexSet) {
        offsets
            .compactMap { try? fetchItems()[$0] }
            .forEach { context.delete($0) }
    }
    
    func saveContext() throws {
        guard context.hasChanges else {
            return
        }
        
        do {
            try context.save()
        } catch {
            throw DatabaseError.saveContextFailed
        }
    }
    
}
