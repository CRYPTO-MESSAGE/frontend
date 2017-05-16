//
//  SignInVCViewController.swift
//  CryptoMessage
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class SignInVCViewController: UIViewController {
    
    private let CONTACTS_SEGUE = "ContactsSegue";

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: CONTACTS_SEGUE, sender: nil);
    }
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "ContactSegue", sender: nil);
    }

    


} //class
