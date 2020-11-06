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
        let lista: [String] = ["name 1,email","name 2,email 2"]
        
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
        self.present(alert, animated: true, completion: nil)
        let action = UIAlertAction(title: "Si", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let removeAction: UIAlertAction = UIAlertAction(title: "Eliminar", style: UIAlertAction.Style.destructive, handler:
        
            { action in
        
                   UserDefaults.standard.removeObject(forKey: self.nameEmailKey)
    
                   UserDefaults.standard.synchronize()
        
                  print("El usuario ha eliminado los datos")
        
               })
        
    
    }
}
