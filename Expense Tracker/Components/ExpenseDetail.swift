//
//  ExpenseDetail.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-09.
//

import SwiftUI

struct ExpenseDetail: View {
    
    var amount: String
    var date: Date
    var name: String
    var type: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 75)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(type)
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(.teal)
                    Text(date, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Spacer()
                
                Text("$\(amount)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.red)
                    .padding()
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    ExpenseDetail(amount: "72", date: Date(), name: "Groceries", type: "Food")
}
