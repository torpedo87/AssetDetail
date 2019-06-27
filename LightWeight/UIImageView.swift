//
//  UIImageView.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageWithUrlString(urlString: String) {
        let url = URL(string: urlString)
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                self.image = imageToCache
            }
            
            }.resume()
    }
}
