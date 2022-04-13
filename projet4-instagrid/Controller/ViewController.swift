//
//  ViewController.swift
//  projet4-instagrid
//
//  Created by Yann Perfy on 23/02/2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var isSelected:Bool = false
    @IBOutlet weak var instagridChange1: UIButton!
    
    @IBOutlet weak var instagridChange2: UIButton!
    
    @IBOutlet weak var instagridChange3: UIButton!
        
    @IBAction func instagridAction1(_ sender: Any) {
        if isSelected {
        isSelected = false
        instagridChange1.setImage(UIImage(named: "Selected.png"), for: .normal)
   
        }
        else {
            isSelected = true
            instagridChange1.setImage(UIImage(named: "Layout 1"), for: .normal)
        }
        }

    @IBAction func instagridAction2(_ sender: Any) {
        if isSelected {
        isSelected = false
        instagridChange2.setImage(UIImage(named: "Selected.png"), for: .normal)
   
        }
        else {
            isSelected = true
            instagridChange2.setImage(UIImage(named: "Layout 2"), for: .normal)
        }
    }
    @IBAction func instagridAction3(_ sender: Any) {
        if isSelected {
        isSelected = false
        instagridChange3.setImage(UIImage(named: "Selected.png"), for: .normal)
   
        }
        else {
            isSelected = true
            instagridChange3.setImage(UIImage(named: "Layout 3"), for: .normal)
        }
        
}
    
    @IBAction func swipeUpToShare(_ sender: Any) {
        let activityVc =    UIActivityViewController(activityItems: ["pictures"], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = self.view
        self.present(activityVc, animated: true , completion: nil)
    }
    
    

    @IBOutlet var btnBouttonpress: [UIButton]!
    
    @IBAction func btnImagePicker(_ sender: Any) {
      let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let ac = UIAlertController(title: "select Image", message: "select image from?", preferredStyle: .actionSheet)
        
        
        let cameraBtn = UIAlertAction(title: "camera", style: .default) {[weak self](_) in
            self?.showImagePicker(selectedSource: .camera)
        }
        let libraryBtn = UIAlertAction(title: "library", style: .default) {[weak self](_) in
            self?.showImagePicker(selectedSource: .photoLibrary)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cameraBtn)
                                                                     ac.addAction(libraryBtn)
                                                                     ac.addAction(cancelBtn)
                                                                     self.present(ac, animated: true, completion: nil)
                                                                     }
    
   
    @objc func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("selected source not available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = true
   
        self.present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
            
           
        }

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
 
}

