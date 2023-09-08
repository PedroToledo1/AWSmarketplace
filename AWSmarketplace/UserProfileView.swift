//
//  UserProfileView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 8/9/23.
//

import SwiftUI
struct UserProfileView: View {
    @EnvironmentObject var userState: UserState
    let columns = Array(repeating: GridItem(.flexible(minimum: 150)), count: 2)
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {}) {
                    AvatarView(
                        state: .local(image: UIImage(systemName: "person")!),
                        fromMemoryCache: true
                    )
                    .frame(width: 75, height: 75)
                }
                Text(userState.username)
                    .font(.headline)
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<10) { i in
                            Color.red
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
            }
            .navigationTitle("My Account")
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {},
                        label: { Image(systemName: "rectangle.portrait.and.arrow.right") }
                    )
                }
            }
        }
    }
}
