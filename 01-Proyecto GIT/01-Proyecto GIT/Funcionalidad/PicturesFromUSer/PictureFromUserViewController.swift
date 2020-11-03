//
//  Album.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 03/11/2020.
//

import Foundation
import UIKit
import Photos

class PictureFromUserViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func eligeFotoAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let temImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = temImage
        dismiss(animated: true, completion: nil)
        
        print("imagepick")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: false, completion: nil)
        
        print("cancel")
        
    }
    
}




