// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "ea78230c9180591dd5391c0c71383238"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Product.self)
    ModelRegistry.register(modelType: User.self)
  }
}