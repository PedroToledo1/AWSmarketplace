//
//  UserProfileView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 8/9/23.
//

import SwiftUI
import Amplify

struct UserProfileView: View {
    @EnvironmentObject var userState: UserState
    let columns = Array(repeating: GridItem(.flexible(minimum: 150)), count: 2)
    @State var isImagePickerVisible: Bool = false
    @State var newAvatarImage: UIImage?
    var avatarState: AvatarState {
        newAvatarImage.flatMap({ AvatarState.local(image: $0) })
        ?? .remote(avatarKey: userState.userAvatarKey)
    }
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: { isImagePickerVisible = true }) {
                    AvatarView(
                        state: avatarState,
                        fromMemoryCache: true
                    )
                    .frame(width: 75, height: 75)
                    .onChange(of: avatarState) { _ in
                        Task {
                            await uploadNewAvatar()
                        }
                    }
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
            .sheet(isPresented: $isImagePickerVisible) {
                ImagePickerView(image: $newAvatarImage)
            }
            .toolbar {
                ToolbarItem {
                    Button(
                        action: {
                            Task {
                                await signOut()
                            }
                        },
                        label: { Image(systemName: "rectangle.portrait.and.arrow.right") }
                    )
                }
            }
        }
    }
    func signOut() async {
        do {  _ = await Amplify.Auth.signOut()
            print("signed out")
            _ = try await Amplify.DataStore.clear()
        } catch {
            print("error")
        }
    }
    func uploadNewAvatar() async {
        guard let avatarData = newAvatarImage?.jpegData(compressionQuality: 1) else { return }
        do {
            let avatarKey = try await Amplify.Storage.uploadData(
                key: userState.userAvatarKey,
                data: avatarData
            ).value
            print("Finished uploading:", avatarKey)
        } catch {
            print(error)
        }
    }
}
 
