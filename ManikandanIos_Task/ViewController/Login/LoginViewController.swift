//
//  LoginViewController.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var buttonLogin: CustomLoginButton!
    @IBOutlet weak var buttonSignup: CustomSignupButton!
    @IBOutlet weak var textFieldEmailAddress: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    
    var passwordClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetupMethod()
        
    }
    
    func viewSetupMethod()  {
        self.view.backgroundColor = .white
        textFieldPassword.isSecureTextEntry = true
    }
    
    //MARK: Textfield Validation

     func validateLoginForm() -> Bool {
        view.endEditing(true)
        if textFieldEmailAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter email address")
            return false
        }
         else if Utilities.isValidEmail(emailString: textFieldEmailAddress.text ?? "" ) == false  {
             AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter valid email address\nEg:Mani@mail.com")
             return false
         }
        else if textFieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter password")
            return false
        }
         else if Utilities.isValidPassword(passString: textFieldPassword.text ?? "" ) == false  {
             AlertView.shared.showAlertMessage(view: self, title: "Alert", description: "Please enter valid Password (8-16)\nEg:Mani@202320")
             return false
         }
        return true
    }
    
    //MARK: Button Action

    @IBAction func passwordVisibleButtonAction(_ sender: UIButton) {
        if passwordClick {
            textFieldPassword.isSecureTextEntry = false
            sender .setImage(UIImage(named: "password_InActive_icon"), for: .normal)
        } else {
            textFieldPassword.isSecureTextEntry = true
            sender .setImage(UIImage(named: "password_Active_icon"), for: .normal)
        }
        passwordClick = !passwordClick
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if validateLoginForm() {
            UserDefaults.standard.setEmailAddress(value: textFieldEmailAddress.text ?? "")
            UserDefaults.standard.setPassword(value: textFieldPassword.text ?? "")

            AlertView.shared.showAlert(view: self, title: "Alert", description: "Login Successfully!")
            AlertView.shared.delegate = self
        }
       
    }
    @IBAction func signUpButtonAction(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController!.pushViewController(signUpVC, animated: true)
    }
    @IBAction func ResetPasswordButtonAction(_ sender: Any) {
        let resetVC = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController!.pushViewController(resetVC, animated: true)
    }
    
}
//MARK: Alert Delegtae

extension LoginViewController : alertViewDeleagte{
    
    func alertViewOkButtonAction() {
        textFieldEmailAddress.text = ""
        textFieldPassword.text = ""
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController!.pushViewController(homeVC, animated: true)
        
    }
    
}
