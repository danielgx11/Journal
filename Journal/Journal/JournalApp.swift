//
//  JournalApp.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import SwiftUI

@main
struct JournalApp: App {
//    let persistenceController = PersistenceController.shared
    @Bindable private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
