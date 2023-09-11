// swiftlint:disable all
import Amplify
import Foundation

public struct Message: Model {
  public let id: String
  public var body: String
  public var dateTime: Temporal.DateTime
  public var Sender: User?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  public var messageSenderId: String?
  
  public init(id: String = UUID().uuidString,
      body: String,
      dateTime: Temporal.DateTime,
      Sender: User? = nil,
      messageSenderId: String? = nil) {
    self.init(id: id,
      body: body,
      dateTime: dateTime,
      Sender: Sender,
      createdAt: nil,
      updatedAt: nil,
      messageSenderId: messageSenderId)
  }
  internal init(id: String = UUID().uuidString,
      body: String,
      dateTime: Temporal.DateTime,
      Sender: User? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil,
      messageSenderId: String? = nil) {
      self.id = id
      self.body = body
      self.dateTime = dateTime
      self.Sender = Sender
      self.createdAt = createdAt
      self.updatedAt = updatedAt
      self.messageSenderId = messageSenderId
  }
}