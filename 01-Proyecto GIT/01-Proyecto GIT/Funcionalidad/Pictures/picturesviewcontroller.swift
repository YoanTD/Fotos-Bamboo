//
//  picturesviewcontroller.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 26/10/2020.
//

import Foundation
import UIKit



class PictureViewController : UIViewController {
    
    let reuseIdentifier = String(describing: PicturesCell.self)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     override func viewDidLoad() {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        super.viewDidLoad()
    }
}



extension PictureViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    
}

extension PictureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath.row)

    }
    

}

