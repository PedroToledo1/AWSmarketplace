//
//  MarketplaceError.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 8/9/23.
//

import Foundation
import Amplify

enum MarketplaceError: Error {
    case amplify(AmplifyError)
}
