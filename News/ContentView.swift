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
