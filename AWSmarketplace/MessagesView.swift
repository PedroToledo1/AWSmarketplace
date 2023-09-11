//
//  MessagesView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 10/9/23.
//

import SwiftUI
struct MessagesView: View {
    @EnvironmentObject var userState: UserState
    @State var messages: [Message] = []
    @State var messageBody: String = ""
    let chatRoom: ChatRoom
    let otherUser: User
    let productId: String?
    
    init(chatRoom: ChatRoom, otherUser: User, productId: String? = nil) {
        self.chatRoom = chatRoom
        self.otherUser = otherUser
        self.productId = productId ?? chatRoom.lastMessage?.productId
    }
    
    var body: some View {
        VStack {
            List(messages) { message in
                let sender = message.messageSenderId == userState.userId
                ? User(id: userState.userId, username: userState.username)
                : otherUser
                MessageListCell(message: message, sender: sender)
                    .flip()
            }
            .listStyle(.plain)
            .flip()
            
            HStack {
                TextField("Message", text: $messageBody)
                Button("Send", action: {})
            }
            .padding()
        }
        .navigationTitle(otherUser.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}
extension View {
    func flip() -> some View {
        return self
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
