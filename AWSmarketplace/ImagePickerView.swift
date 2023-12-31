//
//  ImagePickerView.swift
//  AWSmarketplace
//
//  Created by Pedro Toledo on 9/9/23.
//
import SwiftUI
import UIKit
import AVKit

struct ImagePickerView: UIViewControllerRepresentable {

    @Binding var image: UIImage?
    @Environment(\.dismiss) var dismiss
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let imagePickerView: ImagePickerView
    
    init(_ imagePickerView: ImagePickerView) {
        self.imagePickerView = imagePickerView
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePickerView.dismiss.callAsFunction()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerView.dismiss.callAsFunction()
        
        guard let image = info[.originalImage] as? UIImage else { return }
        imagePickerView.image = image
    }
}
