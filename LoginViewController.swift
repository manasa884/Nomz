//
//  LoginViewController.swift
//  Nomz
//
//  Created by Manasa Tipparam on 1/3/16.
//  Copyright © 2016 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameTF.text!, password: passwordTF.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if (user?.objectForKey("emailVerified") as! Bool != true)
            {
                let alert = UIAlertView(title: "Verify Email", message: "Please verify your email and try again", delegate: nil, cancelButtonTitle: "OK")
                alert.show()

            }
            else if user != nil {
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else {
                let alert = UIAlertView(title: "Try Again", message: "Please check your login credentials and try again", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
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
