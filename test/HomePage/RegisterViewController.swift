//
//  RegisterViewController.swift
//  HomePage
//
//  Created by Ravi Dineshbhai Patel on 2023-12-02.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var fNameTextField: UITextField!
    
    @IBOutlet weak var lNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signinClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else{ return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password){ firebaseResult, error in
            if let e = error{
                print("error")
            }
            else{
                //go to home page
                self.performSegue(withIdentifier: "next", sender: self)
            }
        }
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
