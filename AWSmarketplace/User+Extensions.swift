//
//  User+Extensions.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 10/9/23.
//

import SwiftUI
import Foundation

extension User: Hashable {
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id &&
        lhs.username == rhs.username
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(username)
    }
}
