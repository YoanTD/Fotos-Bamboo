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
    var cellWidth : CGFloat = 75
    var cellHeight: CGFloat = 75
    
    @IBAction func yearsBut(_ sender: UIButton) {
        print("hola")
        selecBut(sender)
        cellWidth = 150
        cellHeight = 150
        collectionView.reloadData()
    }
    
    @IBAction func monthBut(_ sender: UIButton) {
        print("qlq")
        selecBut(sender)
        cellWidth = 25
        cellHeight = 25
        collectionView.reloadData()
    }
    
    @IBAction func daysBut(_ sender: UIButton) {
        print("ya tu chave")
        selecBut(sender)
        cellWidth = 30
        cellHeight = 30
        collectionView.reloadData()
        
    }
    
    @IBAction func allPhotosBut(_ sender: UIButton) {
        print("Bambo the best")
        selecBut(sender)
        cellWidth = 60
        cellHeight = 60
        collectionView.reloadData()
        
    }
    
    func selecBut(_ sender : UIButton) {
        allPhotosSelec.isSelected = false
        daysSelec.isSelected = false
        monthSelec.isSelected = false
        yearSelec.isSelected = false
        sender.isSelected = true
        
        
    }
     
    
    @IBOutlet weak var stackViewOut: UIStackView!
    
    
    @IBOutlet weak var yearSelec: UIButton!
    
    @IBOutlet weak var monthSelec: UIButton!
    
    @IBOutlet weak var daysSelec: UIButton!
    
    @IBOutlet weak var allPhotosSelec: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        stackViewOut.layer.cornerRadius = 25
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
            if indexPath.row % 2 == 0 {
                pictureCell.imageView.image = UIImage(named:"pic1")
            } else {
                pictureCell.imageView.image = UIImage(named:"pic2")
                
    // pictureCell.previewImage.image = indexPath.row % 2 == 0 ? UIImage(named: "pic1") : UIImage(named: "pic2")
                
            }
            
            
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
        return CGSize(width: cellWidth, height: cellHeight) // Sirve pa ajustar las medidas de los cuadrados.
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetwenCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetwenCells
    }
    
}


