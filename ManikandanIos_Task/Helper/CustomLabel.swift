//
//  CustomLabel.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    private func configureUI() {
        self.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }
    
    
}
