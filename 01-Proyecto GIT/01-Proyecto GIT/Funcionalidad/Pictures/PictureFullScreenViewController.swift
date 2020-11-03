//
//  PictureFullScreenViewController.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 30/10/2020.
//

import UIKit

class PictureFullScreenViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func xButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("x")
        
}
    
    @IBOutlet weak var swOut: UISwitch!
    
    @IBAction func switchAction(_ sender: Any) {
        print(swOut.isOn)
        
        
    }
    
    
    
    override func viewDidLoad() {
        imageView.image = PicturesViewModel.selectedImage
        super.viewDidLoad()

        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


}
