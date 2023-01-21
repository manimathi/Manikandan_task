//
//  UserDefaults.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import Foundation

enum UserDefaultsKeys : String {
    case emailAddress
    case password
}

extension UserDefaults{
    //MARK: Save email address
    func setEmailAddress(value: String){
        set(value, forKey: UserDefaultsKeys.emailAddress.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve  email address
    func getEmailAddress() -> String{
        return string(forKey: UserDefaultsKeys.emailAddress.rawValue) ?? ""
    }
    
    //MARK: Save password
    func setPassword(value: String){
        set(value, forKey: UserDefaultsKeys.password.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve  password
    func getPassword() -> String{
        return string(forKey:  UserDefaultsKeys.password.rawValue) ?? ""
    }
}
