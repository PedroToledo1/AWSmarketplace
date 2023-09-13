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
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                Button("Sign Up", action: {
                    Task{ await signUp() }
                })
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
                Button("Already have an account? Login.", action: showLogin)
            }
            .padding()
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
