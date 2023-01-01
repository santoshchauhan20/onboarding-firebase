//
//  LoginViewController.swift
//  Stay.com
//
//  Created by Aditya on 01/01/23.
//

import UIKit

class LoginViewController : UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LoginClicked(_ sender: Any) {
        self.didTapLoginButton()
    }

    
    @objc func didTapLoginButton() {
        let loginManager = FirebaseAuthManager()
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
            var message: String = ""
            if (success) {
                message = "User was sucessfully logged in."
            } else {
                message = "There was an error."
            }
            
            print(message)
//            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.display(alertController: alertController)
        }
    }
}
