//
//  AddExpensiveView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct AddExpensiveView: View {
    
    @AppStorage("darkMode") var isDarkMode = false
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var name = ""
    @State private var amount = ""
    @State private var isExpenseAdded = false
    @State private var selectedCategory: String? = nil
    
    let categories = ["Food", "Housing", "Transport", "Entertaiment", "Utilities"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Name of Expense", text: $name)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(isDarkMode ? .black : .white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                
                TextField("Amount", text: $amount)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(isDarkMode ? .black : .white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(categories[0...2], id: \.self) { category
                        in
                        Button {
                            selectedCategory = category
                        } label: {
                            Text(category)
                                .foregroundColor(selectedCategory ==
                                     category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity,
                                       minHeight: 50)
                                .background(selectedCategory ==
                                    category ? .blue : .white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                        }
                    }
                }
                
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(categories[3...4], id: \.self) { category
                        in
                        Button {
                            selectedCategory = category
                        } label: {
                            Text(category)
                                .foregroundColor(selectedCategory ==
                                     category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity,
                                       minHeight: 50)
                                .background(selectedCategory ==
                                    category ? .blue : .white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                            
                        }
                    }
                }
                
                Button {
                    let expense = Expense(context: managedObjectContext)
                    expense.amount = Double(amount) ?? 0
                    expense.date = Date()
                    expense.id = UUID()
                    expense.name = name
                    expense.type = selectedCategory
                    
                    do {
                        try managedObjectContext.save()
                        print("Data saved successfully")
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError)")
                    }
                    
                    isExpenseAdded = true
                    
                    
                } label: {
                    Text("Add Expense")
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }
                .padding()
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Add Expense")
            .alert("Exoense Added!", isPresented:
                    $isExpenseAdded) {
                Button {
                    isExpenseAdded = false
                    name = ""
                    amount = ""
                    selectedCategory = nil
                } label: {
                   Text("Ok")
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    AddExpensiveView()
}
