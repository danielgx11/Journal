//
//  HomeView.swift
//  Journal
//
//  Created by DanielGomesXavier on 23/12/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    // MARK: - CONSTANTS
    
    fileprivate enum Constants {
        static let addNoteLabel = "Add Note"
        static let addNoteIconName = "plus"
        static let navigationTitle = "Journal"
        static let unknownDateLabel = "N/A"
    }
    
    // MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \JournalData.timestamp, ascending: true)], animation: .spring)
    private var items: FetchedResults<JournalData>
    
    @Bindable private var viewModel: HomeViewModel
    
    // MARK: - INITIALIZERS
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.timestamp?.formatted(.dateTime) ?? Constants.unknownDateLabel)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        EditButton()
                            .foregroundStyle(.cyan)
                            .onTapGesture {
                                // TODO: edit current note
                            }
                        
                        Button {
                            // TODO: show bottom sheet to add a new note
                        } label: {
                            Label(Constants.addNoteLabel, systemImage: Constants.addNoteIconName)
                                .foregroundStyle(.cyan)
                        }

                    }
                }
            }
            .navigationTitle(Constants.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        viewModel.deleteNote(at: offsets)
    }
}

#Preview {
    @Previewable @Environment(\.managedObjectContext) var viewContext

    let service = ServiceManager()
    let database = DatabaseManager(context: viewContext)
    let factory = HomeViewFactory()
    let viewModel = HomeViewModel(service: service,
                                  database: database,
                                  factory: factory)
    HomeView(viewModel: viewModel)
}
