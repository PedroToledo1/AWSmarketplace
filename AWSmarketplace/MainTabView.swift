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
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            InboxView()
                .tabItem {
                    Label("Inbox", systemImage: "message")
                }
            UserProfileView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}
