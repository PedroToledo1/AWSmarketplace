//
//  LogInView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//
import Amplify
import SwiftUI

struct LoginView: View {

    @State var username: String = ""
    @State var password: String = ""
    @State var shouldShowSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)


                Button("Log In", action: { Task{ await login() }})
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                Spacer()
                Button("Don't have an account? Sign up.", action: { shouldShowSignUp = true })
                    
            }
            .padding()
            .navigationDestination(isPresented: $shouldShowSignUp) {
                SignUpView(showLogin: { shouldShowSignUp = false })
                    .navigationBarBackButtonHidden(true)
            }
        }
    }

    func login() async {
        do {

            let result = try await Amplify.Auth.signIn(
                username: username,
                password: password
            )
            switch result.nextStep {
            case .done:
                print("login is done")
            default:
                print(result.nextStep)
            }
        } catch {
            print(error)
        }
    }
}
