//
//  MainTabView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 8/9/23.
//

import SwiftUI
struct MainTabView: View {
    var body: some View {
        TabView {
            UserProfileView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}
