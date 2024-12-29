//
//  DatabaseTests.swift
//  JournalTests
//
//  Created by Daniel Gomes Xavier on 29/12/24.
//

import Foundation
import CoreData
import SwiftUI
import Testing

@testable import Journal

@Suite(.tags(.database)) struct DatabaseTests {
    @Environment(\.managedObjectContext) var viewContext
    
    var databaseSpy = DatabaseSpy()
    
    @Test("Fetch Items in Database", arguments: [true, false])
    func fetchItems(shoulwShowError: Bool) {
        databaseSpy.shouldShowErrorFetchingItems = shoulwShowError
        
        do {
            let result = try databaseSpy.fetchItems()
            
            #expect(databaseSpy.fetchItemsCalled)
            #expect(!databaseSpy.shouldShowErrorFetchingItems)
            #expect(result.isEmpty)
        } catch {
            #expect(databaseSpy.fetchItemsCalled)
            #expect(databaseSpy.shouldShowErrorFetchingItems)
        }
    }
    
    @Test("Fetch Just 1 item in Database", arguments: [true, false])
    func fetchItem(shouldShowError: Bool) {
        databaseSpy.shouldShowErrorFetchingItems = shouldShowError
        
        do {
            let result = try databaseSpy.fetchItem(with: .init())
            
            #expect(databaseSpy.fetchItemCalled)
            #expect(!databaseSpy.shouldShowErrorFetchingItem)
            #expect(result == nil)
        } catch {
            #expect(databaseSpy.fetchItemCalled)
            #expect(databaseSpy.shouldShowErrorFetchingItem)
        }
    }
    
    @Test("Save Item in Database")
    func save() {
        databaseSpy.save(journal: JournalEntity.asEmptyData)
        
        #expect(databaseSpy.saveCalled)
    }
    
    @Test("Delete Item in Database")
    func delete() {
        databaseSpy.delete(at: .init(integer: .zero))
        
        #expect(databaseSpy.deleteCalled)
    }
    
    @Test("Save Context in Database", arguments: [true, false])
    func saveContext(shouldShowError: Bool) {
        databaseSpy.shouldShowErrorSavingContext = shouldShowError
        
        do {
            try databaseSpy.saveContext()
            
            #expect(databaseSpy.saveContextCalled)
            #expect(!databaseSpy.shouldShowErrorSavingContext)
        } catch {
            #expect(databaseSpy.saveContextCalled)
            #expect(databaseSpy.shouldShowErrorSavingContext)
        }
        
    }
}
