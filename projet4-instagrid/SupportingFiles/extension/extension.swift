//
//  extension.swift
//  projet4-instagrid
//
//  Created by Yann Perfy on 15/04/2022.
//

import Foundation
import UIKit


extension ViewController: UIImagePickerControllerDelegate {
    
// permet de sellectionner les images
    
    func showImagePickerController() {
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            btnBouttonpress[indexButtons].setImage(image, for: .normal)
            btnBouttonpress[indexButtons].imageView?.contentMode = .scaleAspectFill
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
