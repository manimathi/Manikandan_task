//
//  SignUpViewController.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmailAddress: CustomTextField!
    @IBOutlet weak var textFiledConfirmPassword: CustomTextField!
    @IBOutlet weak var textFiledPassword: CustomTextField!
    
    var passwordClick = true
    var confirmPasswordClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetupMethod()
        self.navigationController?.navigationBar.isHidden = true
    }
    func viewSetupMethod() {
        textFiledPassword.isSecureTextEntry = true
        textFiledConfirmPassword.isSecureTextEntry = true
    }
    
    //MARK: Textfield Validation

    func validateRegisterForm() -> Bool {
       view.endEditing(true)
       if textFieldEmailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
           AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter email address")
           return false
       }
        else if Utilities.isValidEmail(emailString: textFieldEmailAddress.text ?? "" ) == false  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter valid email address\nEg:Mani@mail.com")
            return false
        }
       else if textFiledPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
           AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter password")
           return false
       }
        else if Utilities.isValidPassword(passString: textFiledPassword.text ?? "" ) == false  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter valid Password (8-16)\nEg:Mani@202320")
            return false
        }
        else if textFiledPassword.text != textFiledConfirmPassword.text  {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter match Password")
            return false
        }
       return true
   }
    
    //MARK: Button Action

    @IBAction func passwordVisibleButtonAction(_ sender: UIButton) {
        if passwordClick {
            textFiledPassword.isSecureTextEntry = false
            sender .setImage(UIImage(named: "password_InActive_icon"), for: .normal)
        } else {
            textFiledPassword.isSecureTextEntry = true
            sender .setImage(UIImage(named: "password_Active_icon"), for: .normal)
        }
        passwordClick = !passwordClick
    }
    
    @IBAction func confirmPasswordVisibleButtonAction(_ sender: UIButton) {
        if confirmPasswordClick {
            textFiledConfirmPassword.isSecureTextEntry = false
            sender .setImage(UIImage(named: "password_InActive_icon"), for: .normal)
        } else {
            textFiledConfirmPassword.isSecureTextEntry = true
            sender .setImage(UIImage(named: "password_Active_icon"), for: .normal)
        }
        confirmPasswordClick = !confirmPasswordClick
    }
    @IBAction func signupButtonAction(_ sender: Any) {
        if validateRegisterForm() {
            UserDefaults.standard.setEmailAddress(value: textFieldEmailAddress.text ?? "")
            UserDefaults.standard.setPassword(value: textFiledPassword.text ?? "")

            AlertView.shared.showAlert(view: self, title: "Alert", description: "SignUp Successfully!")
            AlertView.shared.delegate = self
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: Alert Delegtae

extension SignUpViewController : alertViewDeleagte{
    
    func alertViewOkButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
