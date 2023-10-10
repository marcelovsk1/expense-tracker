//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct ExpenseView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order:
            .reverse)]) var expenses: FetchedResults<Expense>
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        HStack {
                            Text("Welcome")
                                .font(.title)
                            Spacer()
                        }
                        ForEach(expenses) { expense in
                            NavigationLink(destination: 
                                EditExpenseView(expense: expense)) {
                                ExpenseDetail(amount: String(expense.amount),
                                    date: expense.date!, name: expense.name!,
                                    type: expense.type ?? "Transportation")
                            }
                                .contextMenu {
                                    Button {
                                        deleteExpense(expense: expense)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                        
                                    }
                                }
                        }
                        
                    }
                }
                
            }
            .padding()
            .navigationTitle("Expenses")
        }
    }
    
    func deleteExpense(expense: Expense) {
        withAnimation {
            managedObjectContext.delete(expense)
            
            do {
                try managedObjectContext.save()
                print("Data saved successfully")
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError)")
            }
        }
    }
}

#Preview {
    ExpenseView()
}
