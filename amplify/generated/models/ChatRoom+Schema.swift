// swiftlint:disable all
import Amplify
import Foundation

extension ChatRoom {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case memberIds
    case lastMessage
    case Messages
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let chatRoom = ChatRoom.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "ChatRooms"
    model.syncPluralName = "ChatRooms"
    
    model.attributes(
      .primaryKey(fields: [chatRoom.id])
    )
    
    model.fields(
      .field(chatRoom.id, is: .required, ofType: .string),
      .field(chatRoom.memberIds, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(chatRoom.lastMessage, is: .optional, ofType: .embedded(type: LastMessage.self)),
      .hasMany(chatRoom.Messages, is: .optional, ofType: Message.self, associatedWith: Message.keys.chatroomID),
      .field(chatRoom.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(chatRoom.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension ChatRoom: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}
extension ChatRoom: Identifiable {}
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
extension ChatRoom {
    func otherMemberId(currentUser id: String) -> String {
        let otherMemberId = self.memberIds?.first {
            $0 != id
        }
        return otherMemberId ?? ""
    }
}
