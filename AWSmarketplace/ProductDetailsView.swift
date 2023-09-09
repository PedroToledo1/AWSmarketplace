//
//  ProductDetailsView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 9/9/23.
//

import AmplifyImage
import SwiftUI
import Amplify

struct ProductDetailsView: View {
    @EnvironmentObject var userState: UserState
    @Environment(\.dismiss) var dismiss
    
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack {
                AmplifyImage(key: product.imageKey)
                    .scaleToFillWidth()
                Text("$\(product.price)")
                    .font(.largeTitle)
                product.productDescription.flatMap(Text.init)
                if userState.userId != product.userId {
                    Button("Chat", action: {})
                } else {
                    Button("Delete product", action: {Task { await deleteProduct() }})
                }
            }
            .navigationTitle(product.name)
        }
    }
    func deleteProduct() async {
        do {
            // 1
            try await Amplify.DataStore.delete(product)
            print("Deleted product \(product.id)")
            
            // 2
            let productImageKey = product.id + ".jpg"
            try await Amplify.Storage.remove(key: productImageKey)
            print("Deleted file: \(productImageKey)")
            
            dismiss.callAsFunction()
        } catch {
            print(error)
        }
    }
}
