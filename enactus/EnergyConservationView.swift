//
//  EnergyConservationView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct EnergyConservationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Energy Conservation")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                
                InfoCard(
                    icon: "lightbulb.fill",
                    title: "LED Bulbs",
                    description: "Switch to LED bulbs which use 75% less energy than incandescent lighting."
                )
                
                InfoCard(
                    icon: "thermometer",
                    title: "Thermostat",
                    description: "Adjust your thermostat by 1-2 degrees to save energy without sacrificing comfort."
                )
                
                InfoCard(
                    icon: "powerplug.fill",
                    title: "Unplug Devices",
                    description: "Unplug electronics when not in use to prevent phantom energy drain."
                )
            }
            .padding()
        }
        .navigationTitle("Energy")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EnergyConservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnergyConservationView()
        }
    }
}
