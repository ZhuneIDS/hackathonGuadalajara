//
//  ProfileView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var tracker: EcoTracker
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) var dismiss
    @Binding var isAuthenticated: Bool

    @State private var userName: String = "Eco Warrior"
    @State private var userEmail: String = "eco@example.com"
    @State private var memberSince: Date = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @State private var ecoLevel: String = "Green Guardian"
    @State private var showingEditProfile = false
    
    var body: some View {
        NavigationStack {
            Form {
                // Cabeza
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.green)
                            
                            Text(userName)
                                .font(.title2)
                                .padding(.top, 8)
                            
                            Text(ecoLevel)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                }
                
                // info
                Section(header: Text("Account Information")) {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(userEmail)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Member Since")
                        Spacer()
                        Text(memberSince.formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(.secondary)
                    }
                }
                
                // estadisticas
                Section(header: Text("Eco Stats")) {
                    HStack {
                        Text("Total Impact")
                        Spacer()
                        Text("\(Int(tracker.totalImpact)) pts")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Actions Completed")
                        Spacer()
                        Text("\(tracker.actions.filter { $0.isCompleted }.count)/\(tracker.actions.count)")
                            .foregroundColor(.secondary)
                    }
                }
                
                // acciones
                Section {
                    Button("Edit Profile") {
                        showingEditProfile = true
                    }
                    
                    Button(action: {
                        authManager.isAuthenticated = false
                        dismiss()
                    }) {
                        Text("Log Out")
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") {
                        dismiss()  // Manual dismiss button
                    }
                }
            }
            .sheet(isPresented: $showingEditProfile) {
                EditProfileView(userName: $userName, userEmail: $userEmail)
            }
        }
    }
}
