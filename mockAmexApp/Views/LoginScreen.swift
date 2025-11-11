//
//  LoginScreen.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/11/25.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0/255, green: 50/255, blue: 100/255),
                        Color(red: 0/255, green: 15/255, blue: 20/255)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Login with Email")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    Button("Login") {
                        viewModel.signIn(email: email, password: password)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text("login failed")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationDestination(isPresented: .constant(viewModel.user != nil)) {
                HelloScreen()
            }
        }
    }
}

#Preview {
    LoginScreen()
}
