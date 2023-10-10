//
//  SettingsView.swift
//  Expense Tracker
//
//  Created by Marcelo Amaral Alves on 2023-10-06.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("darkMode") var isDarkMode = false 
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SettingsView()
}
