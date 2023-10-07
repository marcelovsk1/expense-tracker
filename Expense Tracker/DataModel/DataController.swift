//
//  DataController.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ExpenseTracker")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in data controller \(error.localizedDescription)")
            }
        }
    }
}


