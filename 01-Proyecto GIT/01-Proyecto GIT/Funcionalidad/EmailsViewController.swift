
//  Emails.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 05/11/2020.
//

import UIKit
import MessageUI

class EmailsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    
    
    
    @IBOutlet weak var nameOut: UITextField!
    @IBOutlet weak var emailOut: UITextField!
    
    @IBOutlet weak var textOut: UITextView!
    private let nameEmailKey: String = "MynameKey"
    
    private var listOfEmails: [String] = []
    
    
    
    @IBAction func sendMail(_ sender: Any) {
        var emailTitle = "Feedback"
        var messageBody = "Feature request or bug report?"
        var toRecipents = ["Bambo@academy.com"]
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        self.present(mc, animated: true, completion: nil)
    }
    
    

@IBAction func guardarAct(_ sender: Any) {
    guard let name = nameOut.text,
          let email = emailOut.text else { return }
    let fullString: String = "\(name);\(email)"
    listOfEmails.append(fullString)
    let lista: [String] = ["name 1,email","name 2,email 2"]
    UserDefaults.standard.set(listOfEmails, forKey: nameEmailKey)
    UserDefaults.standard.synchronize()
}

override func viewDidLoad() {
    super.viewDidLoad()
    
    if let storeValue = UserDefaults.standard.stringArray(forKey: nameEmailKey){
        listOfEmails.append(contentsOf: storeValue)
    }
    for value in listOfEmails {
        textOut.text.append("\n" + value)
        print("Stored value: \(value)")
    }
    
}


@IBAction func resetAction(_ sender: Any) {
    
    UserDefaults.standard.removeObject(forKey: nameEmailKey)
    UserDefaults.standard.synchronize()
    
    let alert : UIAlertController = UIAlertController(title: "Ojo👁!", message: "Seguro que quieres borrar?", preferredStyle: UIAlertController.Style.actionSheet)
    //        self.present(alert, animated: true, completion: nil)
    let action = UIAlertAction(title: "Si", style: UIAlertAction.Style.cancel, handler: nil)
    alert.addAction(action)
    let cancelAction:  UIAlertAction = UIAlertAction(title: "Eliminar", style: UIAlertAction.Style.destructive, handler:
                                                        { action in
                                                            print("El usuario ha cancelado el borrado de datos")
                                                        })
    alert.addAction(cancelAction)
    
    let removeAction: UIAlertAction = UIAlertAction(title: "Default", style: UIAlertAction.Style.default, handler:
                                                        
                                                        { action in
                                                            
                                                            UserDefaults.standard.removeObject(forKey: self.nameEmailKey)
                                                            
                                                            UserDefaults.standard.synchronize()
                                                            
                                                            print("El usuario ha eliminado los datos")
                                                            
                                                        })
    alert.addAction(removeAction)
    
    self.present(alert, animated: true, completion: nil)
    
    
}

func saveNameAndEmail() {
    guard let name = nameOut.text,
          let email = emailOut.text else { return }
    
    let fullString: String = "\(name);\(email)"
    listOfEmails.append(fullString)
    UserDefaults.standard.setValue(listOfEmails, forKey: nameEmailKey )
    UserDefaults.standard.synchronize()
    print("Savin \(fullString)")
    
}
}

extension EmailsViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == nameOut {
            emailOut.becomeFirstResponder()
        } else if textField == emailOut {
            saveNameAndEmail()
            textField.resignFirstResponder()
        }
        
        return true
    }
}







//* todo esto va debajo de voiewDidLoada
//        if let storeValue: String = UserDefaults.standard.string(forKey: nameEmailKey) {
//            textOut.text?.append("\n" + storeValue)
//            print("Stored value: \(storeValue)")
//        }*
