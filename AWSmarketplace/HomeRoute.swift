//
//  HomeRoute.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 9/9/23.
//

import Foundation

enum HomeRoute: Hashable {
    case productDetails(Product)
    case postNewProduct
    case chat(chatRoom: ChatRoom, otherUser: User, productId: String)
    
}
class HomeNavigationCoordinator: ObservableObject {
    @Published var routes: [HomeRoute] = []
}
