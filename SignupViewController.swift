//
//  SignupViewController.swift
//  Stay.com
//
//  Created by Aditya on 01/01/23.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var actionCreateAccount: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        actionCreateAccount.addTarget(self, action:#selector(self.didTapSignUpButton), for: .touchUpInside)

    }
    
    
    @objc func didTapSignUpButton() {
        
        let signUpManager = FirebaseAuthManager()
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully created."
                } else {
                    message = "There was an error."
                }
                print(message)
            }
        }
    }
    
    
   
}
