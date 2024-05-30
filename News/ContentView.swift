//
//  ContentView.swift
//  News
//
//  Created by Arshif on 30/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NewsListView()
            .navigationTitle("News")
        }
    }
}

#Preview {
    ContentView()
}

extension Color {
    static var titleColor: Color {
        Color(red: 12/255, green: 12/255, blue: 12/255)
    }
    
    static var dateColor: Color {
        Color(red: 45/255, green: 5/255, blue: 5/255)
    }
}
