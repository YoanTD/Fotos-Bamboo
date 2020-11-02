//
//  ImagineData.swift
//  01-Proyecto GIT
//
//  Created by Yoan Tarrillo diaz on 29/10/2020.
//

import Foundation
import UIKit

class ImagesData {
    static func numOfImages() -> Int {
        guard let urls : [URL] = imagesUrl() else { return 0 }
        return urls.count
    }
    
    static func imagesUrl() -> [URL]? {
        return Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)
    }
    
    static func imageForUrl(_ url: URL) -> UIImage? {
        let imageName: String = url.lastPathComponent
        return UIImage(named: imageName)
        
        
        
    }
    
    static func imageForPosition(_ position: Int) -> UIImage? {
        let arrayIndex: Int = position % numOfImages()
        if arrayIndex < numOfImages() {
            if let url: URL = imagesUrl()?[arrayIndex] {
                return imageForUrl(url)
            }
        }
        return nil
    }
}
