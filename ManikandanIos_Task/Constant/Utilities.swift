//
//  Utilities.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import Foundation

class Utilities: NSObject {
    
    static let shared = Utilities()
    
    static func isValidEmail(emailString:String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         
         let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
         return emailPred.evaluate(with: emailString)
     }
    static func isValidPassword(passString:String) -> Bool {
         let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,16}"
         
         let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        
         return passPred.evaluate(with: passString)
     }
    
    static func saveEmailAddress(email: String){
        
    }
}


