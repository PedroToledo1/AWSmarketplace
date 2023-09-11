//
//  InboxView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 10/9/23.
//

import SwiftUI
struct InboxView: View {
    @EnvironmentObject var userState: UserState
    // 1
    @State var chatRooms: [ChatRoom] = []
    // 2
    @State var users: [User] = []
    
    // 3
    var chatRoomAndMemberList: [(chatRoom: ChatRoom, user: User)] {
        let pairs = chatRooms.compactMap { chatRoom -> (ChatRoom, User)? in
            let otherUserId = chatRoom.otherMemberId(
                currentUser: userState.userId
            )
            guard let user = users.first(where: {$0.id == otherUserId}) else { return nil }
            return (chatRoom, user)
        }
        return pairs
    }
    
    var body: some View {
        NavigationStack {
            // 4
            List(chatRoomAndMemberList, id: \.0.id) { pair in
                // 5
                NavigationLink(value: ChatRoute.chatRoom(pair.chatRoom, pair.user)) {
                    if let lastMessage = pair.chatRoom.lastMessage {
                        // 6
                        InboxListCell(
                            otherChatRoomMember: pair.user,
                            lastMessage: lastMessage
                        )
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Inbox")
            .navigationDestination(for: ChatRoute.self) { route in
                switch route {
                case .chatRoom(let chatRoom, let user):
                    MessagesView(chatRoom: chatRoom, otherUser: user)
                }
            }
        }
    }
}
