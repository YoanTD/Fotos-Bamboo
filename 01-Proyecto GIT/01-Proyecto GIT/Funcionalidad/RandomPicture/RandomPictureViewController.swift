//
//  RandomPictureViewController.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 02/11/2020.
//

import UIKit

class RandomPictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        imageView.image = #imageLiteral(resourceName: "nKC772R_qog.jpg")
        
        super.viewDidLoad()
        let randomNumber = Int.random(in: 0..<ImagesData.numOfImages())
        let img: UIImage? = ImagesData.imageForPosition(randomNumber)
        imageView.image = img
        print("random number : \(randomNumber)")
        
    }
    
    
}
