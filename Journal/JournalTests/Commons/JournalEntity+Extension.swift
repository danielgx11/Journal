//
//  JournalEntity+Extension.swift
//  JournalTests
//
//  Created by Daniel Gomes Xavier on 29/12/24.
//

import Foundation

@testable import Journal

extension JournalEntity {
    
    static var asEmptyData: JournalEntity {
        JournalEntity(timestamp: Date(),
                      title: "",
                      note: "")
    }
}
