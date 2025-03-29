//
//  AuthManager.swift
//  enactus
//
//  Created by Javier Fernandez on 27/03/25.
//

//o uso este manager o uso el "bind" 
import SwiftUI

class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
}
