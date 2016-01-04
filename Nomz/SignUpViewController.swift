//
//  SignUpViewController.swift
//  Nomz
//
//  Created by Manasa Tipparam on 1/3/16.
//  Copyright © 2016 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        var username = self.usernameTF.text
        var email = self.emailTF.text
        var password = self.passwordTF.text
        var confirmPass = self.confirmPasswordTF.text
        
        if (username == "" || email == "" || password == "" || confirmPass == "")
        {
            var alert = UIAlertView(title: "Incomplete fields", message: "Please check all the fields and try again.", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        
        else if (password != confirmPass)
        {
            var alert = UIAlertView(title: "Passwords don't match", message: "Please check the fields and try again.", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            password = "";
            confirmPass = "";
        }
        
        else
        {
            var newUser = PFUser()
            newUser.username = username
            newUser.email = email
            newUser.password = password

            newUser.signUpInBackgroundWithBlock
                {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if error == nil
                    {
                        dispatch_async(dispatch_get_main_queue())
                        {
                            let next = self.storyboard?.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
                            self.presentViewController(next, animated: true, completion: nil)
                        }
                        
                    }
                    else if (error?.code == 125)
                    {
                        newUser.deleteInBackground()
                        var alert = UIAlertView(title: "Invalid email address", message: "Please check your email and try again.", delegate: self, cancelButtonTitle: "OK")
                        alert.show()
                        email = "";
                    }

                    else if (error?.code == 202)
                    {
                        newUser.deleteInBackground()
                        var alert = UIAlertView(title: "Username Taken", message: "Please select a new username.", delegate: self, cancelButtonTitle: "OK")
                        alert.show()
                        username = "";
                    }
                    else if (error?.code == 203)
                    {
                        newUser.deleteInBackground()

                        var alert = UIAlertView(title: "Email Taken", message: "Please enter a new email.", delegate: self, cancelButtonTitle: "OK")
                        alert.show()
                        email = "";
                    }

            }


        }
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
