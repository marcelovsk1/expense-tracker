//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
