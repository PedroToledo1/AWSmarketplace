//
//  ProductDetailsView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 9/9/23.
//

import AmplifyImage
import SwiftUI
import Amplify

struct ProductDetailsView: View {
    @EnvironmentObject var userState: UserState
    @EnvironmentObject var navigationCoordinator: HomeNavigationCoordinator
    @Environment(\.dismiss) var dismiss
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack {
                AmplifyImage(key: product.imageKey)
                    .scaleToFillWidth()
                Text("$\(product.price)")
                    .font(.largeTitle)
                product.productDescription.flatMap(Text.init)
                if userState.userId != product.userId {
                    Button("Chat", action: {Task { await getOrCreateChatRoom() }})
                } else {
                    Button("Delete product", action: {Task { await deleteProduct() }})
                }
            }
            .navigationTitle(product.name)
        }
    }
    func deleteProduct() async {
        do {
            try await Amplify.DataStore.delete(product)
            print("Deleted product \(product.id)")
            let productImageKey = product.id + ".jpg"
            try await Amplify.Storage.remove(key: productImageKey)
            print("Deleted file: \(productImageKey)")
            
            dismiss.callAsFunction()
        } catch {
            print(error)
        }
    }
    func getOrCreateChatRoom() async {
        do {
            let chatRooms = try await Amplify.DataStore.query(
                ChatRoom.self,
                where: ChatRoom.keys.memberIds.contains(product.userId)
                    && ChatRoom.keys.memberIds.contains(userState.userId)
            )
            let chatRoom: ChatRoom
            if let existingChatRoom = chatRooms.first {
                chatRoom = existingChatRoom
            } else {
                let newChatRoom = ChatRoom(memberIds: [product.userId, userState.userId])
                let savedChatRoom = try await Amplify.DataStore.save(newChatRoom)
                chatRoom = savedChatRoom
            }
            guard let otherUser = try await Amplify.DataStore.query(
                User.self,
                byId: chatRoom.otherMemberId(currentUser: userState.userId)
            ) else {return}
                navigationCoordinator.routes.append(
                    .chat(
                        chatRoom: chatRoom,
                        otherUsersName: otherUser,
                        productId: product.id
                    )
                )
        } catch {
            print(error)
        }
    }
}
