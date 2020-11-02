//
//  picturesviewcontroller.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 26/10/2020.
//

import Foundation
import UIKit






class PictureViewController : UIViewController {
    //    let maxHorizontalCells : CGFloat = 10
    let marginBetwenCells : CGFloat = 5
    let reuseIdentifier = String(describing: PicturesCell.self)
    var cellWidth : CGFloat = 75
    var cellHeight: CGFloat = 75
    var numOfHorizontalCells: CGFloat = 2
    
    @IBAction func yearsBut(_ sender: UIButton) {
        print("hola")
        selecBut(sender)
        //        cellWidth = 150
        //        cellHeight = 150
        numOfHorizontalCells = 1
        collectionView.reloadData()
        
        
    }
    
    @IBAction func monthBut(_ sender: UIButton) {
        print("qlq")
        selecBut(sender)
        cellWidth = 25
        cellHeight = 25
        numOfHorizontalCells = 3
        collectionView.reloadData()
    }
    
    @IBAction func daysBut(_ sender: UIButton) {
        print("ya tu chave")
        selecBut(sender)
        cellWidth = 30
        cellHeight = 30
        numOfHorizontalCells = 5
        collectionView.reloadData()
        
    }
    
    @IBAction func allPhotosBut(_ sender: UIButton) {
        print("Bambo the best")
        selecBut(sender)
        cellWidth = 60
        cellHeight = 60
        numOfHorizontalCells = 7
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
        } else if UIDevice.current.orientation.isPortrait {
            print("Portait")
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
                
            }
            
        }
    }
}

extension PictureViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImagesData.numOfImages()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .yellow
        if let pictureCell = (cell as? PicturesCell) {
            print(pictureCell.titleLabel.text)
            pictureCell.titleLabel.text = "\(indexPath.row)"
            pictureCell.imageView.image = ImagesData.imageForPosition(indexPath.row)
            print(indexPath.row)
            
        }
        return cell
    }
}

extension PictureViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath.row)
        PicturesViewModel.selectedImage = ImagesData.imageForPosition(indexPath.row)
        performSegue(withIdentifier: "segueToDetail", sender: nil)
        
    }
}

extension PictureViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width - (numOfHorizontalCells-1)*marginBetwenCells) / numOfHorizontalCells
        return CGSize(width: cellWidth, height: cellWidth) // Sirve pa ajustar las medidas de los cuadrados.
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetwenCells
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetwenCells
    }
    
}
