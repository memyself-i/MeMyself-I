//
//  SignInViewController.swift
//  MeMyself-I
//
//  Created by user148140 on 4/12/19.
//  Copyright © 2019 Hao. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController, UITextFieldDelegate {

 
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var Password: UILabel!
    
    @IBOutlet weak var UsernameText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    
    @IBAction func signin(_ sender: Any) {
        
        let Username = UsernameText.text!
        let Password = PasswordText.text!
        
        PFUser.logInWithUsername(inBackground: Username, password: Password)
        { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "MainSegue", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UsernameText.delegate = self
        self.PasswordText.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UsernameText.resignFirstResponder()
        PasswordText.resignFirstResponder()
        return(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
