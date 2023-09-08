//
//  AWSmarketplaceApp.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 6/9/23.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin
import AWSDataStorePlugin

@main
struct AWSmarketplaceApp: App {
    init() {
        configureAmplify()
    }
    var body: some Scene {
        WindowGroup {
            Sessionview()
        }
    }
}

func configureAmplify() {
    do {
        try Amplify.add(plugin: AWSCognitoAuthPlugin())
        let models = AmplifyModels()
        try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models))
        try Amplify.configure()
        
        print("Successfully configured Amplify")
        
    } catch {
        print("Failed to initialize Amplify", error)
    }
}
