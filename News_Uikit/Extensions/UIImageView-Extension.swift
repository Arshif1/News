//
//  UIImageView-Extension.swift
//  News_Uikit
//
//  Created by Arshif on 25/06/2024.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(from url: URL?, placeholder: UIImage? = nil) {
        // Set the placeholder image if provided
        self.image = placeholder
        
        guard let url else { return }
        
        // Check for a cached image
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
            return
        }
        
        // Download the image data asynchronously
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            guard let data = data, error == nil else { return }
            if let image = UIImage(data: data) {
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        task.resume()
    }
}

