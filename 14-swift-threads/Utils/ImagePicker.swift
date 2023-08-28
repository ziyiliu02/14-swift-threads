//
//  ImagePicker.swift
//  14-swift-threads
//
//  Created by Liu Ziyi on 28/8/23.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool 
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

extension ImagePicker {
    class Coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ picker: ImagePicker){
            self.parent = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                // We were able to get the image
                DispatchQueue.main.async {
                    self.parent.selectedImage = image
                }
            }
            
            // Dismiss the picker
            parent.isPickerShowing = false 
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Run code when the user has cancelled the picker UI
        }
    }
}
