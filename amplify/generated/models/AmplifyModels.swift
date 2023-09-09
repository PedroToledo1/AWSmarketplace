// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "8bdefb98e8db7e12aaf0ef737d69bf2e"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: UntitledModel.self)
  }
}