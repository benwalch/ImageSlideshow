//
//  InputSource.swift
//  ImageSlideshow
//
//  Created by Petr Zvoníček on 14.01.16.
//
//

import UIKit

@objc public protocol InputSource {
    var caption: String? { get set }
    func set(to imageView: UIImageView);
}

open class ImageSource: NSObject, InputSource {
    public var caption: String?
    var image: UIImage!
    
    public init(image: UIImage) {
        self.image = image
    }
    
    public init?(imageString: String) {
        if let image = UIImage(named: imageString) {
            self.image = image
            super.init()
        } else {
            // this may be simplified in Swift 2.2, which fixes the failable initializer compiler issues
            super.init()
            return nil
        }
    }

    @objc public func set(to imageView: UIImageView) {
        imageView.image = image
    }
}
