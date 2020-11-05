//
//  PictureFullScreenViewController.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 30/10/2020.
//

import UIKit

class PictureFullScreenViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textFieldOut.text = ImagesData.getTitle(PicturesViewModel.selectedIdex!)
        labelSwitch.text = "I like it! ❤️"
        print("didAppearfullscreen")
        print("careVerga! xD!!! ")
        print(PicturesViewModel.selectedIdex)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    @IBOutlet weak var textFieldOut: UITextField!
    
    
    
    
    
    @IBAction func xButton(_ sender: Any) {
        print(textFieldOut.text)
        
        dismiss(animated: true, completion: nil)
        print("x")
        print("careVerga! xD!!! ")
    }
    
    @IBOutlet weak var labelSwitch: UILabel!
    
    @IBOutlet weak var swOut: UISwitch!
    
    @IBAction func switchAction(_ sender: Any) {
        
        
        if swOut.isOn == true {
            ImagesData.likeImageAtPosition(PicturesViewModel.selectedIdex!)
            print("encendido")
            print("todo ok")
        } else {
            ImagesData.dislikeImageAtPosition(PicturesViewModel.selectedIdex!)
            print("apagado")
        }
        guard let index: Int = PicturesViewModel.selectedIdex else { return }
        swOut.isOn = ImagesData.likeForPosition(index)
        
    }
    
    
    override func viewDidLoad() {
        imageView.image = PicturesViewModel.selectedImage
        super.viewDidLoad()
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ImagesData.setTitle(textFieldOut.text!, position: PicturesViewModel.selectedIdex!)
        print("hola ,adios")
        
        print(PicturesViewModel.selectedIdex)
    }
    

}




// ultima ac



// Uncomment the following line to preserve selection between presentations
// self.clearsSelectionOnViewWillAppear = false

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem

