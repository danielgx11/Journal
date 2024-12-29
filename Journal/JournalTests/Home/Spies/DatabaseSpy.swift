//
//  DatabaseSpy.swift
//  JournalTests
//
//  Created by Daniel Gomes Xavier on 29/12/24.
//

import Foundation
import CoreData

@testable import Journal

final class DatabaseSpy: DatabaseManagerProtocol {
    
    var shouldShowErrorFetchingItems = false
    var shouldShowErrorFetchingItem = false
    var shouldShowErrorSavingContext = false
    
    private(set) var fetchItemsCalled = false
    private(set) var fetchItemCalled = false
    private(set) var saveCalled = false
    private(set) var deleteCalled = false
    private(set) var saveContextCalled = false
    
    func fetchItems() throws -> [JournalData] {
        fetchItemsCalled = true
        
        if shouldShowErrorFetchingItems {
            throw MessageError.default
        }
        
        return []
    }
    
    func fetchItem(with id: NSManagedObjectID) throws -> JournalData? {
        fetchItemCalled = true
        
        if shouldShowErrorFetchingItem {
            throw MessageError.default
        }
        
        return nil
    }
    
    func save(journal: JournalEntity) {
        saveCalled = true
    }
    
    func delete(at offsets: IndexSet) {
        deleteCalled = true
    }
    
    func saveContext() throws {
        saveContextCalled = true
        
        if shouldShowErrorSavingContext {
            throw MessageError.default
        }
    }
    
}

extension JournalData {
    
    static var asEmptyData: JournalData {
        JournalData()
    }
}
