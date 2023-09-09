//
//  InboxView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 9/9/23.
//

import SwiftUI
struct InboxView: View {
    @EnvironmentObject var userState: UserState
    @State var chatRooms: [ChatRoom] = []
    @State var users: [User] = []
    
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
            List(chatRoomAndMemberList, id: \.0.id) { pair in
                NavigationLink(value: ChatRoute.chatRoom(pair.chatRoom, pair.user)) {
                    if let lastMessage = pair.chatRoom.lastMessage {
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
