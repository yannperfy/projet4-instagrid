//
//  borderView.swift
//  projet4-instagrid
//
//  Created by Yann Perfy on 06/04/2022.
//

import UIKit
@IBDesignable
class borderView: UIView {
    @IBInspectable var cornerRAdius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRAdius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
        
    }
}
