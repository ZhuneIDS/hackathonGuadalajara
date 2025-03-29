//
//  WaterConservationView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct WaterConservationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Water Conservation")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                
                InfoCard(
                    icon: "drop.fill",
                    title: "Shorter Showers",
                    description: "Reducing your shower time by 2 minutes can save up to 10 gallons of water per shower."
                )
                
                InfoCard(
                    icon: "wrench.fill",
                    title: "Fix Leaks",
                    description: "A dripping faucet can waste 20 gallons of water per day. Fix leaks promptly."
                )
                
                InfoCard(
                    icon: "washer.fill",
                    title: "Efficient Appliances",
                    description: "Use low-flow showerheads and WaterSense labeled products to save water."
                )
            }
            .padding()
        }
        .navigationTitle("Water")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WaterConservationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WaterConservationView()
        }
    }
}
