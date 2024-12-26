//
//  DataController.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import Foundation
import CoreData

@Observable
final class DataController {
    
    // MARK: - PROPERTIES
    
    let container = NSPersistentContainer(name: "Journal")
    
    // MARK: - INITIALIZERS
    
    init() {
        container.loadPersistentStores { description, error in
            debugPrint(error?.localizedDescription ?? "")
            
            #warning("TODO: handle error")
        }
    }
}
