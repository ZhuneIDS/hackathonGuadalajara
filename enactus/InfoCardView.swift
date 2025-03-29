//
//  InfoCardView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct InfoCardView<Destination: View>: View {
    let icon: String
    let color: Color
    let title: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(color)
                Text(title)
                    .font(.headline)
            }
            .frame(width: 150, height: 150)
            .background(Color(.systemBackground))
            .cornerRadius(15)
            .shadow(radius: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
