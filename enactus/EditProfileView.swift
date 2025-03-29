//
//  EditProfileView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//
import SwiftUI


struct EditProfileView: View {
    @Binding var userName: String
    @Binding var userEmail: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $userName)
                    TextField("Email", text: $userEmail)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // luego hago que se guarden en realidad los cambios
                        dismiss()
                    }
                    .disabled(userName.isEmpty || userEmail.isEmpty)
                }
            }
        }
    }
}
