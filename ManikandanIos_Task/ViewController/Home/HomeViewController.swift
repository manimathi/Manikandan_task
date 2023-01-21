//
//  HomeViewController.swift
//  ManikandanIos_Task
//
//  Created by Manikandan on 21/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labelEmailAddress: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetupMethod()
        self.navigationController?.navigationBar.isHidden = true
    }
    func viewSetupMethod()  {
        labelEmailAddress.text = "\( UserDefaults.standard.getEmailAddress())"
        labelPassword.text = "\( UserDefaults.standard.getPassword())"
    }
    
    //MARK: Button Action

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
