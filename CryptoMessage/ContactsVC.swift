//
//  ContactsVC.swift
//  CryptoMessage
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var contactTable: UITableView!
    
    private let CELL_ID = "Cell";
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath);
        
        cell.textLabel?.text = "THIS WORKS";
        
        return cell;
        
    }
    
    @IBAction func logout(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }

} // class






















