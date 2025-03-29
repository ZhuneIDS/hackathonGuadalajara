//
//  EcoTracker.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import Foundation

// clase para manejar el tracker
class EcoTracker: ObservableObject {
    //estas son las acciones que se pueden hacer diarias
    @Published var actions: [EcoAction] = [
        EcoAction(title: "Saved water", description: "Reduced shower time", impactPoints: 10),
        EcoAction(title: "Used public transport", description: "Avoided driving", impactPoints: 15),
        EcoAction(title: "Recycled", description: "Reduced waste", impactPoints: 20)
    ]
    
    var totalImpact: Double {
        actions.filter { $0.isCompleted }.reduce(0) { $0 + $1.impactPoints }
    }
    
    var maxPossibleImpact: Double {
        actions.reduce(0) { $0 + $1.impactPoints }
    }
}

struct EcoAction: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let impactPoints: Double
    var isCompleted: Bool = false
}
