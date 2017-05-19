//
//  SignInVCViewController.swift
//  CryptoMessage
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire

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
        Alamofire.request(ApiConfig.url + "/auth", method: .post, parameters: ["username": loginTextField.text ?? "", "password": passwordTextField.text ?? ""], encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
            if let data = response.result.value {
                let json = data as! NSDictionary
                ApiConfig.token = json["token"] as! String
                let user = json["user"] as! NSDictionary
                ApiConfig.username = user["username"] as! String
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let ContactsVC = storyBoard.instantiateViewController(withIdentifier: "ContactsVC") as! ContactsVC
                self.present(ContactsVC, animated:true, completion:nil)
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        performSegue(withIdentifier: "ContactSegue", sender: nil);
    }

    


} //class
