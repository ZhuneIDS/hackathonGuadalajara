//
//  TransportView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct TransportView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Eco-Friendly Transport")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                
                InfoCard(
                    icon: "bus.fill",
                    title: "Public Transit",
                    description: "Using public transportation reduces CO₂ emissions by an average of 4,800 lbs per year."
                )
                
                InfoCard(
                    icon: "bicycle",
                    title: "Bike or Walk",
                    description: "Short trips are perfect for active transportation - good for you and the planet."
                )
                
                InfoCard(
                    icon: "car.fill",
                    title: "Carpool",
                    description: "Sharing rides cuts emissions and reduces traffic congestion."
                )
            }
            .padding()
        }
        .navigationTitle("Transport")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TransportView()
        }
    }
}
