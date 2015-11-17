//
//  SignupSecondViewController.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/14/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class SignupSecondViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var whichLabel: UILabel!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var workerButton: UIButton!
    @IBOutlet weak var clientButton: UIButton!
    
    var name: String!
    var city: String!
    var type = "worker"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func workerButtonPressed(sender: UIButton) {
        type = "worker"
        
        UIView.animateWithDuration(5.0) { () -> Void in
            self.workerButton.layer.shadowRadius = 5
            self.workerButton.layer.shadowColor = UIColor.blackColor().CGColor
            self.workerButton.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.workerButton.layer.shadowOpacity = 1
            
            self.clientButton.layer.shadowRadius = 0
        }
    }
    
    @IBAction func clientButtonPressed(sender: UIButton) {
        type = "client"
        UIView.animateWithDuration(5.0) { () -> Void in
            self.clientButton.layer.shadowRadius = 5
            self.clientButton.layer.shadowColor = UIColor.blackColor().CGColor
            self.clientButton.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.clientButton.layer.shadowOpacity = 1
            
            self.workerButton.layer.shadowRadius = 0
        }
    }
    
    
    @IBAction func signupButtonPressed(sender: UIButton) {
        
            print("Starting to create the tree")
            
            FBController.createUserTree(name, type: type, description: descriptionTextView.text!, city: city) { (errorPresent, error) -> Void in
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
                    if (self.type == "worker") {
                        self.performSegueWithIdentifier("signupToPost", sender: self)
                    } else if (self.type == "client") {
                        self.performSegueWithIdentifier("signupToWorker", sender: self)
                    }
                }
            }
    }
    
    
    
    
    
    func setupUI() {
        // Text view UI
        descriptionTextView.backgroundColor = UIColor.clearColor()
        descriptionTextView.layer.borderColor = UIColor.blackColor().CGColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 5
        
        // Signup button UI
        signupButton.backgroundColor = UIColor.whiteColor()
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    // MARK: UITextViewDelegate
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
