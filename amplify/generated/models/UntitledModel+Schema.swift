// swiftlint:disable all
import Amplify
import Foundation

extension UntitledModel {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let untitledModel = UntitledModel.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "UntitledModels"
    model.syncPluralName = "UntitledModels"
    
    model.attributes(
      .primaryKey(fields: [untitledModel.id])
    )
    
    model.fields(
      .field(untitledModel.id, is: .required, ofType: .string),
      .field(untitledModel.username, is: .required, ofType: .string),
      .field(untitledModel.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(untitledModel.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension UntitledModel: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}