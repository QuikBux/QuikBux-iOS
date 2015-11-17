//
//  SignupViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signupContinueButtonPressed(sender: UIButton) {
        FBController.signup(emailTextField.text!, password: passwordTextField.text!) { (errorPresent, error) -> Void in
            if errorPresent {
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
                // Successful signup
                print("Everything went fine!")
                self.performSegueWithIdentifier("continueSignupSegue", sender: self)

            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "continueSignupSegue") {
            let newVC = segue.destinationViewController as! SignupSecondViewController
            newVC.name = self.nameTextField.text!
            newVC.city = self.cityTextField.text!
        }
    }
    
    
    
    
    
    
    
    
    
    
    func setupUI() {
        
        // Signup button UI setup
        signupButton.backgroundColor = UIColor.whiteColor()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.blackColor().CGColor
        
        // Name text field UI setup
        nameTextField.backgroundColor = UIColor.clearColor()
        nameTextField.text = ""
        nameTextField.attributedPlaceholder = NSAttributedString(string:"Name",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        
        let bottomBorder1 = CALayer()
        bottomBorder1.frame = CGRectMake(0.0, nameTextField.frame.size.height - 1, nameTextField.frame.size.width, 1.0);
        bottomBorder1.backgroundColor = UIColor.blackColor().CGColor
        nameTextField.layer.addSublayer(bottomBorder1)
        
        // Email text field UI setup
        emailTextField.backgroundColor = UIColor.clearColor()
        emailTextField.text = ""
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        
        let bottomBorder2 = CALayer()
        bottomBorder2.frame = CGRectMake(0.0, emailTextField.frame.size.height - 1, emailTextField.frame.size.width, 1.0);
        bottomBorder2.backgroundColor = UIColor.blackColor().CGColor
        emailTextField.layer.addSublayer(bottomBorder2)
        
        // Password text field UI setup
        passwordTextField.backgroundColor = UIColor.clearColor()
        passwordTextField.text = ""
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        
        let bottomBorder3 = CALayer()
        bottomBorder3.frame = CGRectMake(0.0, passwordTextField.frame.size.height - 1, passwordTextField.frame.size.width, 1.0);
        bottomBorder3.backgroundColor = UIColor.blackColor().CGColor
        passwordTextField.layer.addSublayer(bottomBorder3)
        
        // City text field UI setup
        cityTextField.backgroundColor = UIColor.clearColor()
        cityTextField.text = ""
        cityTextField.attributedPlaceholder = NSAttributedString(string:"City",
            attributes:[NSForegroundColorAttributeName: UIColor.blackColor()])
        
        let bottomBorder4 = CALayer()
        bottomBorder4.frame = CGRectMake(0.0, cityTextField.frame.size.height - 1, cityTextField.frame.size.width, 1.0);
        bottomBorder4.backgroundColor = UIColor.blackColor().CGColor
        cityTextField.layer.addSublayer(bottomBorder4)
    }
    
    // MARK: UITextFieldDelegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
