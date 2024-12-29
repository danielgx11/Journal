//
//  HomeViewModelTests.swift
//  JournalTests
//
//  Created by Daniel Gomes Xavier on 28/12/24.
//

import Foundation
import Testing

@testable import Journal

@Suite(.tags(.home)) struct HomeViewModelTests {
    
    var useCaseSpy = HomeUseCaseSpy()
    var databaseSpy = DatabaseSpy()
    var factorySpy = HomeViewFactorySpy()
    
    @MainActor var sut: HomeViewModel!
    
    init() async throws {
        sut = await HomeViewModel(useCase: useCaseSpy,
                                  database: databaseSpy,
                                  factory: factorySpy)
    }
    
    @Test("Fetching user location success/failure",
          .disabled("Without API key to test yet"),
          arguments: [true, false])
    func fetchLocation(shouldShowError: Bool) async {
        useCaseSpy.shouldThrowError = shouldShowError
        await sut.fetchLocation(with: UserLocationEntity(latitude: "43.9380", longitude: "19.9320"))
        
        do {
            let location = try await useCaseSpy.fetchLocation()
            
            #expect(useCaseSpy.fetchLocationCalled)
            #expect(!shouldShowError, "Error was not expected but occurred")
            #expect(location.latitude == LocationData.emptyData.latitude)
            #expect(location.longitude == LocationData.emptyData.longitude)
        } catch {
            #expect(useCaseSpy.fetchLocationCalled)
            #expect(shouldShowError, "Error should occur")
            #expect(error as? MessageError == MessageError.default)
        }
    }
    
    @Test("Saving a note")
    func saveNote() async {
        let entity = JournalEntity(timestamp: Date(),
                                   title: "Test note",
                                   note: "Testing a new note")
        await sut.saveNote(with: entity)
        
        #expect(databaseSpy.saveCalled)
        #expect(databaseSpy.saveContextCalled)
        #expect(!databaseSpy.shouldShowErrorSavingContext)
    }
    
    @Test("Delete a note")
    func deleteNote() async {
        let entity = JournalEntity(timestamp: Date(),
                                   title: "Test note",
                                   note: "Testing a new note")
        await sut.saveNote(with: entity)
        await sut.deleteNote(at: .init(integer: .zero))
        
        #expect(databaseSpy.saveCalled)
        #expect(databaseSpy.saveContextCalled)
        #expect(databaseSpy.deleteCalled)
        #expect(!databaseSpy.shouldShowErrorSavingContext)
    }
}
