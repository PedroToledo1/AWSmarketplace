// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "07cf61d45d524bf1748d483e2758b67b"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Message.self)
    ModelRegistry.register(modelType: ChatRoom.self)
    ModelRegistry.register(modelType: Product.self)
    ModelRegistry.register(modelType: User.self)
  }
}