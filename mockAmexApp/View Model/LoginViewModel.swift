//
//  LoginViewModel.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/11/25.
//

import FirebaseAuth
internal import Combine

class SignInViewModel: ObservableObject {
    @Published var user: FirebaseAuth.User?
    @Published var errorMessage: String?
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            self?.user = result?.user
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
        }
    }
}
