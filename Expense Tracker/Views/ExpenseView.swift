//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct ExpenseView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order:
            .reverse)]) var expenses: FetchedResults<Expense>
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView()
                
            }
            .padding()
            .navigationTitle("Expenses")
        }
    }
}

#Preview {
    ExpenseView()
}
