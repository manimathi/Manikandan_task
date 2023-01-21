//
//  Button.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import Foundation
import UIKit

class CustomLoginButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    private func configureUI() {
        self.backgroundColor = UIColor.colorBlue
        self.layer.cornerRadius = 10
        self.tintColor = .white
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
}

class CustomSignupButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    private func configureUI() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.tintColor = UIColor.colorBlue
        self.layer.borderColor =  UIColor.colorBlue.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
}
