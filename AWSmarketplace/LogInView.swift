//
//  LogInView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//

import SwiftUI

struct LoginView: View {
    // 1
    @State var username: String = ""
    @State var password: String = ""
    // 2
    @State var shouldShowSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                // 3
                TextField("Username", text: $username)
                SecureField("Password", text: $password)
                Button("Log In", action: {})
                Spacer()
                Button("Don't have an account? Sign up.", action: { shouldShowSignUp = true })
            }
            // 4
            .navigationDestination(isPresented: $shouldShowSignUp) {
                SignUpView(showLogin: { shouldShowSignUp = false })
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}
