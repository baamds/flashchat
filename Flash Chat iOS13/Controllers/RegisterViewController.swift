//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Amir Bakhshi on 2020-09-02.
//  Copyright © 2020 Amir Bakhshi. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // in case there was an error, here you can create an alert message
                    let errorMsg = e.localizedDescription
                    showAlert()
                    
                    // show the alert to user, message comes from firebase
                    // the error is related either to password or email
                    func showAlert() {
                        let alert = UIAlertController(title: "Registration Failed!", message: "\(errorMsg)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
                        }))
                        self.present(alert, animated: true)
                    }
                } else {
                    // if no error, register succeeded, navigate to ChatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
        }
    }

    
}
}
