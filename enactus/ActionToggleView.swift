//
//  ActionToggleView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//
import SwiftUI

struct ActionToggleView: View {
    @Binding var action: EcoAction
    
    var body: some View {
        Toggle(isOn: $action.isCompleted) {
            VStack(alignment: .leading) {
                Text(action.title)
                    .font(.subheadline)
                Text(action.description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
