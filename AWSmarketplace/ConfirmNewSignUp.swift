//
//  ConfirmNewSignUp.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//


import Amplify
import SwiftUI
struct ConfirmSignUp: View {

    let username: String
    
    @State var confirmationCode: String = ""
    @State var shouldShowLogin: Bool = false
    
    var body: some View {
        VStack {
            TextField("Verification Code", text: $confirmationCode)
            Button("Submit", action: { Task { await confirmSignUp() } })
        }

        .navigationDestination(isPresented: .constant(shouldShowLogin)) {
            LoginView()
        }
    }
    func confirmSignUp() async {
        do {

            let result = try await Amplify.Auth.confirmSignUp(
                for: username,
                confirmationCode: confirmationCode
            )
            switch result.nextStep {

            case .done:
                DispatchQueue.main.async {
                    self.shouldShowLogin = true
                }
            default:
                print(result.nextStep)
            }
        } catch {
            print(error)
        }
    }
}
