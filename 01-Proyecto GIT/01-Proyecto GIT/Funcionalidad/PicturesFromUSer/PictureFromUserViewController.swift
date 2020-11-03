//
//  Album.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 03/11/2020.
//

import Foundation
import UIKit


class PictureFromUserViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = #imageLiteral(resourceName: "gLAR8V6H_SU.jpg")
        
    }
    
    @IBAction func eligeFotoAction(_ sender: Any) {
        print("hola")
    }
    
    
    
    
    
    
    
        
    }
    
    


