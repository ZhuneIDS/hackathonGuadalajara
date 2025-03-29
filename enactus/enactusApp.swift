//
//  enactusApp.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

@main
struct EnactusApp: App {
    @StateObject var tracker = EcoTracker()
    @State var isAuthenticated = true // asumimos que siempre esta auntenticado el usuario
    
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                DashboardView(isAuthenticated: $isAuthenticated) // usando el binding en vez del manager
                    .environmentObject(tracker)
            } else {
                AuthView()
                    .onReceive(NotificationCenter.default.publisher(for: .authenticated)) { _ in
                        isAuthenticated = true
                    }
            }
        }
    }
}
