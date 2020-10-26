//
//  picturesviewcontroller.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 26/10/2020.
//

import Foundation
import UIKit



class PictureViewController : UIViewController {
    let name : String = ""
    
    @IBOutlet weak var PhotoViewController: UICollectionView!
}

extension PictureViewController: UICollectionViewDataSource {
    

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
}
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
    cell.backgroundColor = .black
    return cell
}

}

