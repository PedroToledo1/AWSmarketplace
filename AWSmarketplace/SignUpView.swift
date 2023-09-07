//
//  SignUpView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//

import SwiftUI

    struct SignUpView: View {
        // 1
        let showLogin: () -> Void
        
        @State var username: String = ""
        // 2
        @State var email: String = ""
        @State var password: String = ""
        @State var shouldShowConfirmSignUp: Bool = false
        
        var body: some View {
            VStack {
                Spacer()
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                Button("Sign Up", action: {})
                Spacer()
                Button("Already have an account? Login.", action: showLogin)
            }
            // 3
            .navigationDestination(isPresented: .constant(shouldShowConfirmSignUp)) {
                ConfirmSignUp(username: username)
            }
        }
    }
