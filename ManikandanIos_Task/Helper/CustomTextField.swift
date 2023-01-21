//
//  TextField.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    private func configureUI() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 4.0
        
        if let _ = self.placeholder{
         self.attributedPlaceholder = NSAttributedString(string:self.placeholder!,
                                                         attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
          }
        
    }
}
