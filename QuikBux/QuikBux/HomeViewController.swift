//
//  ViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myRootRef.unauth()
        
        setupUI()
        
        FBController.filterUsers { (arr) -> Void in
            //print(arr)
        }
        
        //FBController.uploadPost("Need someone to move my furniture", title: "Mover", name: "Jack")
        
        if (myRootRef.authData != nil) {
            
            FBController.getUserType { (result) -> Void in
//            if (type == "worker") {
//                self.performSegueWithIdentifier("signupToPost", sender: self)
//            } else if (type == "client") {
//                self.performSegueWithIdentifier("signupToWorker", sender: self)
//            }
        }
        }
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Button functions
    @IBAction func loginButtonPressed(sender: UIButton) {
        FBController.login(emailTextField.text!, password: passwordTextField.text!) { (errorPresent, error) -> Void in
            if (errorPresent) {
                // Error was found
                switch (error) {
                case .EmailTaken:
                    print("Handle invalid user")
                case .InvalidEmail:
                    print("Handle invalid email")
                case .InvalidPassword:
                    print("Handle invalid password")
                default:
                    print("Handle default situation")
                }
            } else {
                FBController.getUserType({ (result) -> Void in
                    if result.valueForKeyPath("type") as! String == "worker"
                    {
                        print("IMPORTANT")
                        print("The result is worker so i need to look at posts")
                        self.performSegueWithIdentifier("loginToPostSegue", sender: self)
                    } else {
                        print("The result is client so i need to look at workers")
                        print("IMPORTANT")
                        self.performSegueWithIdentifier("loginToWorkerSegue", sender: self)
                    }
                })
            }
        }
    }
    
    @IBAction func signupButtonPressed(sender: UIButton) {
        self.performSegueWithIdentifier("signupStartSegue", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // UI Setup
    func setupUI() {
        // Email text field UI setup
        emailTextField.layer.borderColor = UIColor.clearColor().CGColor
        emailTextField.backgroundColor = UIColor.clearColor()
        emailTextField.text = ""
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        
        let bottomBorder1 = CALayer()
        bottomBorder1.frame = CGRectMake(0.0, emailTextField.frame.size.height - 1, emailTextField.frame.size.width, 1.0)
        bottomBorder1.backgroundColor = UIColor.blackColor().CGColor
        emailTextField.layer.addSublayer(bottomBorder1)
        
        // Password text field UI setup
        passwordTextField.backgroundColor = UIColor.clearColor()
        passwordTextField.text = ""
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        
        let bottomBorder2 = CALayer()
        bottomBorder2.frame = CGRectMake(0.0, passwordTextField.frame.size.height - 1, passwordTextField.frame.size.width, 1.0)
        bottomBorder2.backgroundColor = UIColor.blackColor().CGColor
        passwordTextField.layer.addSublayer(bottomBorder2)
        
        // Signup button UI setup
        signupButton.backgroundColor = UIColor.whiteColor()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.blackColor().CGColor
        
        // Login button UI setup
        loginButton.backgroundColor = UIColor.whiteColor()
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    // MARK: UITextFieldDelegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

