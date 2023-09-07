//
//  ConfirmNewSignUp.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//

import SwiftUI

import SwiftUI
struct ConfirmSignUp: View {
    // 1
    let username: String
    
    @State var confirmationCode: String = ""
    @State var shouldShowLogin: Bool = false
    
    var body: some View {
        VStack {
            TextField("Verification Code", text: $confirmationCode)
            Button("Submit", action: {})
        }
        // 2
        .navigationDestination(isPresented: .constant(shouldShowLogin)) {
            LoginView()
        }
    }
}
