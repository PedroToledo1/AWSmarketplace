// swiftlint:disable all
import Amplify
import Foundation

public struct Message: Model {
  public let id: String
  public var body: String
  public var dateTime: Temporal.DateTime
  public var Sender: User?
  public var chatroomID: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  public var messageSenderId: String?
  
  public init(id: String = UUID().uuidString,
      body: String,
      dateTime: Temporal.DateTime,
      Sender: User? = nil,
      chatroomID: String,
      messageSenderId: String? = nil) {
    self.init(id: id,
      body: body,
      dateTime: dateTime,
      Sender: Sender,
      chatroomID: chatroomID,
      createdAt: nil,
      updatedAt: nil,
      messageSenderId: messageSenderId)
  }
  internal init(id: String = UUID().uuidString,
      body: String,
      dateTime: Temporal.DateTime,
      Sender: User? = nil,
      chatroomID: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil,
      messageSenderId: String? = nil) {
      self.id = id
      self.body = body
      self.dateTime = dateTime
      self.Sender = Sender
      self.chatroomID = chatroomID
      self.createdAt = createdAt
      self.updatedAt = updatedAt
      self.messageSenderId = messageSenderId
  }
}