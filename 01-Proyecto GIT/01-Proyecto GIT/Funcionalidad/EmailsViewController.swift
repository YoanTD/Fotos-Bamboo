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
    
    @IBOutlet weak var textOut: UITextView!
    private let nameEmailKey: String = "MynameKey"
    
    
    @IBAction func guardarAct(_ sender: Any) {
        guard let name = nameOut.text,
              let email = emailOut.text else { return }
        let fullString: String = "\(name);\(email)"
        UserDefaults.standard.set(fullString, forKey: nameEmailKey)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storeValue: String = UserDefaults.standard.string(forKey: nameEmailKey) {
            textOut.text?.append("\n" + storeValue)
            print("Stored value: \(storeValue)")
        }
        
        
    }
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: nameEmailKey)
        UserDefaults.standard.synchronize()
        
        let alert = UIAlertController(title: "", message: "Seguro que quieres borrar?", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "borrar", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}
