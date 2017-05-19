//
//  SignUpVC.swift
//  CryptoMessage
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var validateBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextBtn.isHidden = true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(_ sender: Any) {
        let NSpassword = NSString(string: password1.text!)
        let regex_upper = try! NSRegularExpression(pattern: "[A-Z]", options: [])
        let regex_number = try! NSRegularExpression(pattern: "[0-9]", options: [])
        let regex_special_char = try! NSRegularExpression(pattern: "\\W", options: [])
        
        if (password1.text != password2.text) {
            message.text = "Les mots de passe ne correspondent pas"
            message.textColor = UIColor.red
        } else if ((password1.text?.characters.count)! < 10) {
            message.text = "10 caractères minimum"
            message.textColor = UIColor.red
        } else if (regex_upper.matches(in: password1.text!, options: [], range: NSRange(location: 0, length: NSpassword.length)).count == 0) {
            message.text = "Une majuscule minimum"
            message.textColor = UIColor.red
        } else if (regex_number.matches(in: password1.text!, options: [], range: NSRange(location: 0, length: NSpassword.length)).count == 0) {
            message.text = "Un chiffre minimum"
            message.textColor = UIColor.red
        } else if (regex_special_char.matches(in: password1.text!, options: [], range: NSRange(location: 0, length: NSpassword.length)).count == 0) {
            message.text = "Un caractère spécial minimum"
            message.textColor = UIColor.red
        } else {
            Alamofire.request(ApiConfig.url + "/users", method: .post, parameters: ["password": password1.text ?? "", "confirmPassword": password2.text ?? ""], encoding: URLEncoding.default).responseJSON { response in
                if let data = response.result.value {
                    let json = data as! NSDictionary
                    ApiConfig.token = json["token"] as! String
                    let user = json["user"] as! NSDictionary
                    ApiConfig.username = user["username"] as! String
                    
                    self.message.text = "Votre login est \(ApiConfig.username)"
                    
                    self.password1.isHidden = true
                    self.password2.isHidden = true
                    self.validateBtn.isHidden = true
                    self.nextBtn.isHidden = false
                }
            }
        }
    }

    @IBAction func next(_ sender: Any) {
        let vc = ContactsVC()
        self.present(vc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
