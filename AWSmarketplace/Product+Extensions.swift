//
//  Product+Extensions.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 9/9/23.
//

import Foundation
extension Product: Identifiable {}

extension Product: Hashable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.productDescription == rhs.productDescription
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(price)
        hasher.combine(productDescription)
    }
}
