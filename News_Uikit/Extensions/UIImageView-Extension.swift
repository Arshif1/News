//
//  UIImageView-Extension.swift
//  News_Uikit
//
//  Created by Arshif on 25/06/2024.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(from url: URL?, placeholder: UIImage? = UIImage(systemName: "photo.artframe")?.withTintColor(.gray, renderingMode: .alwaysOriginal)) {
        
        image = placeholder
        
        guard let url else { return }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            image = cachedImage
            return
        }
        
        Task {
            guard let image = try await fetchImage(from: url) else { return }
            imageCache.setObject(image, forKey: url.absoluteString as NSString)
            await MainActor.run {
                self.image = image
            }
        }
    }
    
    private func fetchImage(from url: URL) async throws -> UIImage? {
        let (data, _) = try await URLSession.shared.data(from: url)
        return UIImage(data: data)
    }
}

