//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    let errorMsg = e.localizedDescription
                    self?.showAlert(with: errorMsg)
                }
                else {
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                    print(email, password)
                }
            }
        }
    }
    
    func showAlert(with errorDescription: String) {
        let alert = UIAlertController(title: "Login Failed!", message: "\(errorDescription)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
        }))
        present(alert, animated: true)
    }
    
}
