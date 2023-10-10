//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ExpenseView()
                .tabItem {
                    Image(systemName: "dollarsign")
                    Text("Expenses")
                }
            AddExpensiveView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Expense")
                }
        }
    }
}

#Preview {
    MainView()
}
