//
//  AddExpensiveView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct AddExpensiveView: View {
    
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
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                
                TextField("Amount", text: $amount)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(.white)
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
                    //
                } label: {
                    
                }
                
            }
            .padding(.horizontal)
            .navigationTitle("Add Expense")
        }
    }
}

#Preview {
    AddExpensiveView()
}
