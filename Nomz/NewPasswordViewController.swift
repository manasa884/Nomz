//
//  NewPasswordViewController.swift
//  Nomz
//
//  Created by Charles Gong on 1/5/16.
//  Copyright © 2016 Manasa Tipparam. All rights reserved.
//

import UIKit
import Parse

class NewPasswordViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        var alertController: UIAlertController
        
        if(emailTF.text != "") {
            PFUser.requestPasswordResetForEmailInBackground(emailTF.text!)
            
            alertController = UIAlertController(title: "Forgotten Password", message: "A link has been sent to your email!", preferredStyle: UIAlertControllerStyle.Alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default) { (action) in
                self.performSegueWithIdentifier("sendSegue", sender: self)
            }
            alertController.addAction(dismissAction)
        }
        else {
            alertController = UIAlertController(title: "Forgotten Password", message: "Please enter a valid email.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        }
        self.presentViewController(alertController, animated: true, completion: nil)
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
