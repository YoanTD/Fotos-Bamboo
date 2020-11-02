//
//  RandomPictureViewController.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 02/11/2020.
//

import UIKit

class RandomPictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(refreshPicture) , userInfo: nil, repeats: true)
        
        
        
        
        //        let toImage = UIImage(named:"myname.png") UIView.transitionWithView(self.imageView, duration:5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { self.imageView.image = toImage }, completion: nil)
        
        
        
        //        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { _ in self.refreshPicture()})
       
        
        refreshPicture()
        
        
        //        selector, siempre se tiene que construir el @obj.
        
        
        //        let randomNumber = Int.random(in: 0..<ImagesData.numOfImages())
        //        let img: UIImage? = ImagesData.imageForPosition(randomNumber)
        //        imageView.image = img
        //        print("random number : \(randomNumber)")
        //
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("hola estoy en el did")
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(refreshPicture) , userInfo: nil, repeats: true)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("hola esto en el dis")
        timer.invalidate()
    }
    
    func getRandomPicture() -> UIImage? {
        let minPictureIndex: Int = 0
        let maxPictureIndex: Int = ImagesData.numOfImages() - 1
        let randomIndex: Int = Int.random(in: minPictureIndex...maxPictureIndex)
        let image : UIImage? = ImagesData.imageForPosition(randomIndex)
        return image
    }
    @objc func refreshPicture() {
        UIView.transition(with: imageView, duration: 1.0, options: .transitionCrossDissolve, animations: {
            self.imageView.image = self.getRandomPicture()
    }, completion: nil)
        
    }
    
}

