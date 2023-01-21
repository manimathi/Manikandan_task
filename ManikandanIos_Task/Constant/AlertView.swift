//
//  AlertView.swift
//  ManikandaniOSTask
//
//  Created by Manikandan on 21/01/23.
//

import Foundation
import UIKit

protocol alertViewDeleagte{
    func alertViewOkButtonAction()
}
class AlertView {
    static let shared = AlertView()
    var delegate : alertViewDeleagte?
    
    func showAlert(view: UIViewController, title: String, description: String) {
      let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction.init(title: "Okay", style: .cancel, handler: { (action) in
          self.delegate?.alertViewOkButtonAction()
      }))
      view.present(alert, animated: true, completion: nil)

   }
    
    func showAlertMessage(view: UIViewController, title: String, description: String) {
      let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction.init(title: "Okay", style: .cancel, handler: { (action) in
      }))
      view.present(alert, animated: true, completion: nil)

   }
}
