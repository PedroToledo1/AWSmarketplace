// swiftlint:disable all
import Amplify
import Foundation

public struct ChatRoom: Model {
  public let id: String
  public var memberIds: [String]?
  public var lastMessage: LastMessage?
  public var Messages: Message?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  public var chatRoomMessagesId: String?
  
  public init(id: String = UUID().uuidString,
      memberIds: [String]? = nil,
      lastMessage: LastMessage? = nil,
      Messages: Message? = nil,
      chatRoomMessagesId: String? = nil) {
    self.init(id: id,
      memberIds: memberIds,
      lastMessage: lastMessage,
      Messages: Messages,
      createdAt: nil,
      updatedAt: nil,
      chatRoomMessagesId: chatRoomMessagesId)
  }
  internal init(id: String = UUID().uuidString,
      memberIds: [String]? = nil,
      lastMessage: LastMessage? = nil,
      Messages: Message? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil,
      chatRoomMessagesId: String? = nil) {
      self.id = id
      self.memberIds = memberIds
      self.lastMessage = lastMessage
      self.Messages = Messages
      self.createdAt = createdAt
      self.updatedAt = updatedAt
      self.chatRoomMessagesId = chatRoomMessagesId
  }
}