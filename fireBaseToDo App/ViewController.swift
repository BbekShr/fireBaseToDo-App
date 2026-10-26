//
//  ViewController.swift
//  fireBaseToDo App
//
//  Created by Bibek Shrestha on 2/18/19.
//  Copyright © 2019 Bibek Shrestha. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

var userEmail = ""

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    var ref : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        if Auth.auth().currentUser != nil {
        print("Login Successful")
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            if let email = emailTextField.text, let password = passwordTextField.text {
                
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error ) in
                    if error == nil {
                        self.loginButtonOutlet.setTitle("Logout", for: .normal)
                        userEmail = (Auth.auth().currentUser?.uid)!
                        self.performSegue(withIdentifier: "homeScreenSegue", sender: nil)
                    }
                })
            }
        } else {
            do {
                try Auth.auth().signOut()
                self.loginButtonOutlet.setTitle("Login", for: .normal)
            }
            catch{}
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
               print(user ?? "no email")
                print(Auth.auth().currentUser?.uid ?? "no user id")
            }
        }
        
    }
    
    
}

