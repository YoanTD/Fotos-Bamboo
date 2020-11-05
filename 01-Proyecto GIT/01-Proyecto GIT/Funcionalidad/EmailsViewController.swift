//
//  Emails.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 05/11/2020.
//

import UIKit

class EmailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameOut: UITextField!
    @IBOutlet weak var emailOut: UITextField!
    
    private let nameEmailKey: String = "My nameKey"
    
    
    @IBAction func guardarAct(_ sender: Any) {
        guard let name = nameOut.text,
              let email = emailOut.text else { return }
        let fullString: String = "\(name);\(email)"
        UserDefaults.standard.set(fullString, forKey: nameEmailKey∫)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let StoreValue: String = UserDefaults.standard.string(forKey: nameEmailKey) {
            nameOut.text?.append("\n" + StoreValue)
            print("Stored value: \(StoreValue)")
        }
        
        
        
        guard let nombreTexto: String = nameOut.text else { return }
        
        UserDefaults.standard.set(true, forKey: nombreTexto)
        
    }
    
}
