//
//  ClassCellView.swift
//  HackChallenge
//
//  Created by Ruby P on 11/30/24.
//

import SwiftUI

struct ClassCellView: View {
    let classItem: ClassItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(classItem.name)
                .font(.headline)
                .foregroundColor(.black)
            Text(classItem.schedule)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .background(Color.gray.opacity(0.9))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
