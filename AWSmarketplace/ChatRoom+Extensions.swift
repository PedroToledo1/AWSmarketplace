//
//  ChatRoom+Extensions.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 10/9/23.
//

// 1
extension ChatRoom: Identifiable {}
// 2
extension ChatRoom: Hashable {
    public static func == (lhs: ChatRoom, rhs: ChatRoom) -> Bool {
        lhs.id == rhs.id &&
        lhs.memberIds == rhs.memberIds
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(memberIds)
    }
}
// 3
extension ChatRoom {
    func otherMemberId(currentUser id: String) -> String {
        let otherMemberId = self.memberIds?.first {
            $0 != id
        }
        return otherMemberId ?? ""
    }
}
