//
//  ContentView.swift
//  HackChallenge
//
//  Created by Ruby P on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchQuery: String = ""
    
    // Filtered list of classes
    var filteredClasses: [ClassItem] {
        sampleClasses.filter { searchQuery.isEmpty || $0.name.localizedCaseInsensitiveContains(searchQuery) }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Colors
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all) // This works on iOS 13
                
                VStack {
                    // Search Bar
                    TextField("Search Classes...", text: $searchQuery)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    // Class List View
                    ScrollView {
                        VStack(spacing: 16) { // Replace LazyVStack with VStack
                            ForEach(filteredClasses) { classItem in
                                NavigationLink(destination: ViewController(classItem: classItem)) {
                                    ClassCellView(classItem: classItem)
                                }
                                .buttonStyle(PlainButtonStyle()) // This works on iOS 13
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationBarTitle("Study", displayMode: .inline) // Compatible with iOS 13
            .foregroundColor(.white)
        }
    }
}
