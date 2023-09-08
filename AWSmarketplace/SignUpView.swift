//
//  SignUpView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//

import SwiftUI
import Amplify

    struct SignUpView: View {

        let showLogin: () -> Void
        
        @State var username: String = ""
        @State var email: String = ""
        @State var password: String = ""
        @State var shouldShowConfirmSignUp: Bool = false
        
        var body: some View {
            VStack {
                Spacer()
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                Button("Sign Up", action: {
                    Task{ await signUp() }
                })
                Spacer()
                Button("Already have an account? Login.", action: showLogin)
            }
            .navigationDestination(isPresented: .constant(shouldShowConfirmSignUp)) {
                ConfirmSignUp(username: username)
            }
        }
        func signUp() async {
            let options = AuthSignUpRequest.Options(
                userAttributes: [.init(.email, value: email)]
            )
            do {
                let result = try await Amplify.Auth.signUp(
                    username: username,
                    password: password,
                    options: options
                )
                switch result.nextStep {
                case .confirmUser:
                    DispatchQueue.main.async {
                        self.shouldShowConfirmSignUp = true
                    }
                default:
                    print(result)
                }
            } catch {
                print(error)
            }
        }
    }
