//
//  EditExpenseView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct EditExpenseView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    var expense: FetchedResults<Expense>.Element
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EditExpenseView()
}
