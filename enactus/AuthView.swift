//
//  AuthView.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

import SwiftUI

struct AuthView: View {
    enum AuthMode {
        case login, register
    }
    
    @State private var authMode: AuthMode = .login
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var name = ""
    @State private var isLoading = false
    @State private var authError: String?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Cabeza
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.green)
                    
                    Text(authMode == .login ? "Welcome Back" : "Create Account")
                        .font(.largeTitle.bold())
                    
                    // Errores
                    if let error = authError {
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Formulario
                    VStack(spacing: 16) {
                        if authMode == .register {
                            TextField("Full Name", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .textContentType(.name)
                        }
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textContentType(.password)
                        
                        if authMode == .register {
                            SecureField("Confirm Password", text: $confirmPassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .textContentType(.password)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Bottones
                    Button {
                        handleAuth()
                    } label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text(authMode == .login ? "Log In" : "Register")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(isLoading)
                    .padding(.horizontal)
                    
                    // cambiar a Registro
                    Button {
                        withAnimation {
                            authMode = authMode == .login ? .register : .login
                            authError = nil
                        }
                    } label: {
                        Text(authMode == .login ?
                             "Don't have an account? Register" :
                             "Already have an account? Log In")
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func handleAuth() {
        isLoading = true
        authError = nil
        
        // Validar
        if authMode == .register {
            if password != confirmPassword {
                authError = "Passwords don't match"
                isLoading = false
                return
            }
            
            if password.count < 6 {
                authError = "Password must be at least 6 characters"
                isLoading = false
                return
            }
        }
        
        // Hacer la simulacion
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            // No podemos llamar servicios, eso se haria aqui
            
            NotificationCenter.default.post(name: .authenticated, object: true)
        }
    }
}

// Notificacion
extension Notification.Name {
    static let authenticated = Notification.Name("authenticated")
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
