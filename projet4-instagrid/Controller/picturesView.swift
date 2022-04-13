//
//  picturesview.swift
//  projet4-instagrid
//
//  Created by Yann Perfy on 29/03/2022.
//

import UIKit

class picturesview: UIView {

    @IBOutlet var buttons: [UIButton]!
       var indexOfColor = 0
      
      
      enum Template: Int {
          case One = 0, Two = 1, Three = 2
      }
      var currentTemplate: Template = .Two {
          didSet {
              setTemplate(currentTemplate)
          }
      }
}
