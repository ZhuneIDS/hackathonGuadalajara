//
//  DasboardView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//
import SwiftUI


struct DashboardView: View {
    @StateObject private var tracker = EcoTracker()
    @State private var showingProfile = false
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // seccion de barra de progreso
                    VStack {
                        Text("Your Environmental Impact")
                            .font(.headline)
                        
                        ZStack(alignment: .leading) {
                            Capsule()
                                .frame(height: 20)
                                .foregroundColor(Color(.systemGray5))
                            
//                            Capsule()
//                                .frame(width: CGFloat(tracker.totalImpact / tracker.maxPossibleImpact) * UIScreen.main.bounds.width * 0.8, height: 20)
//                                .foregroundColor(.green)
                            // Progress fill
                            let isComplete = tracker.totalImpact == tracker.maxPossibleImpact
                            
                            Capsule()
                                .frame(width: isComplete ?
                                       UIScreen.main.bounds.width * 0.8 : // sigo peleandome con este
                                       CGFloat(tracker.totalImpact / tracker.maxPossibleImpact) * UIScreen.main.bounds.width * 0.8,
                                       height: 20)
                                .foregroundColor(isComplete ? .green : .green)
                        }
                        .padding(.horizontal)
                        
                        Text("\(Int(tracker.totalImpact)) points of \(Int(tracker.maxPossibleImpact)) possible")
                            .font(.caption)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    
                    // Las cartas con informacion
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        InfoCardView(icon: "drop.fill", color: .blue, title: "Water", destination: WaterConservationView())
                        InfoCardView(icon: "leaf.fill", color: .green, title: "Energy", destination: EnergyConservationView())
                        InfoCardView(icon: "trash.fill", color: .gray, title: "Waste", destination: WasteReductionView())
                        InfoCardView(icon: "car.fill", color: .orange, title: "Transport", destination: TransportView())
                    }
                    .padding(.horizontal)
                    
                    // Acciones diarias
                    VStack(alignment: .leading) {
                        Text("Today's Actions")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach($tracker.actions) { $action in
                            ActionToggleView(action: $action)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Eco Tracker")
            .toolbar {
                // btton del perfil
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileView(isAuthenticated: $isAuthenticated)
                    
                    .environmentObject(tracker)
            }
        
            .background(Color(.systemGroupedBackground))
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(isAuthenticated: .constant(true)) // Pasar el contexto para la preview
            .environmentObject(EcoTracker())
    }
}
