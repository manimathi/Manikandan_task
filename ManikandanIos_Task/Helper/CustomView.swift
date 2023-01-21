//
//  CustomView.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor.colorBlue.cgColor
        self.layer.shadowOffset = CGSize(width:2, height: 2)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }
}
