//
//  picturesviewcontroller.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 26/10/2020.
//

import Foundation
import UIKit



class PictureViewController : UIViewController {
    let maxHorizontalCells : CGFloat = 10
    let marginBetwenCells : CGFloat = 10
    let reuseIdentifier = String(describing: PicturesCell.self)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        super.viewDidLoad()
    }
}



extension PictureViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .yellow
        if let pictureCell = (cell as? PicturesCell) {
        print(pictureCell.titleLabel.text)
            pictureCell.titleLabel.text = "\(indexPath.row)"
            pictureCell.imageView.image = UIImage(named:"pic2")
    }
        return cell
    }
    
    
    
}

extension PictureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath.row)
        
    }
}

extension PictureViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180) // Sirve pa ajustar las medidas de los cuadrados.
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetwenCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetwenCells
    }
    
}


