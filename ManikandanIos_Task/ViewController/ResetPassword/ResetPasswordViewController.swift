//
//  ResetPasswordViewController.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var textfieldPassword: CustomTextField!
    @IBOutlet weak var textFieldConfirmPassword: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: Textfield Validation

    func validateResetPasswordForm() -> Bool {
       view.endEditing(true)
        let oldPassword = "\( UserDefaults.standard.getPassword())"
        let emailAddress = "\( UserDefaults.standard.getEmailAddress())"

       if textfieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
           AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter password")
           return false
       }
        else if Utilities.isValidPassword(passString: textfieldPassword.text ?? "" ) == false  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter valid Password (8-16)\nEg:Mani@202320")
            return false
        }
        else if oldPassword == textfieldPassword.text  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "This Password already used, please enter new Password")
            return false
        }
        else if emailAddress == textfieldPassword.text  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Shouldn't enter email address as password, please enter new Password")
            return false
        }
        else if textfieldPassword.text != textFieldConfirmPassword.text  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter match Password")
            return false
        }
       
       return true
   }
    
    //MARK: Button Action

    @IBAction func ResetPasswordButtonAction(_ sender: Any) {
        if validateResetPasswordForm() {
            UserDefaults.standard.setPassword(value: textfieldPassword.text ?? "")
            AlertView.shared.showAlert(view: self, title: "Alert", description: "Reset Password Successfully!")
            AlertView.shared.delegate = self
        }
    }
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: Alert Delegtae

extension ResetPasswordViewController : alertViewDeleagte{
    
    func alertViewOkButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
   
}
