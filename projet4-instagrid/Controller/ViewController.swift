//
//  ViewController.swift
//  projet4-instagrid
//
//  Created by Yann Perfy on 23/02/2022.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var layoutStackview: UIStackView!
 
    @IBOutlet weak var swipeUPStackView: UIStackView!
    @IBOutlet var btnBouttonpress: [UIButton]!
   
    @IBOutlet weak var instagridChange1: UIButton!
    
    @IBOutlet weak var instagridChange2: UIButton!
    
    @IBOutlet weak var instagridChange3: UIButton!
    var indexButtons = Int()
      let imagePickerController = UIImagePickerController()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
              
    }
    @objc func displayActivityController(_ sender: UIActivityItemSource) {
            print("ActivityController opened")
            let imageView = asImage(borderView)
            let activityController = UIActivityViewController(activityItems: [imageView as Any], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
            self.shareView()
            
            //Completion handler
            activityController.completionWithItemsHandler = { (activityType: UIActivity.ActivityType?, completed: Bool, arrayReturnedItems: [Any]?, error: Error?) in
                if completed {
                    print("share completed")
                    self.cancelShareView()
                    return
                } else {
                    print("cancel")
                    self.cancelShareView()
                }
            }
        }
    func cancelShareView() {
          let translationTransform = CGAffineTransform(translationX: 0, y: 0)
          UIView.animate(withDuration: 0.3) {
              self.swipeUPStackView.transform = .identity
              self.borderView.transform = translationTransform
          }
      }
    
    func asImage(_ view: UIView) -> UIImage? {
          UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
                 defer { UIGraphicsEndImageContext() }
                 if let context = UIGraphicsGetCurrentContext() {
                     view.layer.render(in: context)
                     let image = UIGraphicsGetImageFromCurrentImageContext()
                     return image
                 }
                 return nil
}
    @IBAction func imagesCharge(_ sender: UIButton) {
        indexButtons = sender.tag
        showImagePickerController()
        
    }
    
    
    func shareView () {
        if UIDevice.current.orientation.isLandscape {
            let screenWidth = UIScreen.main.bounds.width
            let translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
            UIView.animate(withDuration: 0.5) {
                self.borderView.transform = translationTransform
                self.swipeUPStackView.transform = translationTransform
            }
        } else {
            let screenHeight = UIScreen.main.bounds.height
            let translationTransform = CGAffineTransform(translationX: 0, y: -screenHeight)
            UIView.animate(withDuration: 0.5) {
                self.swipeUPStackView.transform = translationTransform
                self.borderView.transform = translationTransform
            }
        }
    }
    
    
    var isSelected:Bool = false

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

    

    
}

