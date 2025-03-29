//
//  WaterReductionView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct WasteReductionView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Waste Reduction")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                
                InfoCard(
                    icon: "arrow.3.trianglepath",
                    title: "Recycle Properly",
                    description: "Learn your local recycling rules to ensure materials are processed correctly."
                )
                
                InfoCard(
                    icon: "bag.fill",
                    title: "Reusable Bags",
                    description: "Bring your own bags when shopping to reduce plastic waste."
                )
                
                InfoCard(
                    icon: "takeoutbag.and.cup.and.straw",
                    title: "Compost",
                    description: "Compost food scraps to reduce landfill waste and create nutrient-rich soil."
                )
            }
            .padding()
        }
        .navigationTitle("Waste")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WasteReductionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WasteReductionView()
        }
    }
}
