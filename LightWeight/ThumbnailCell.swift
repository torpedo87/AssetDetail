//
//  ThumbnailCell.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit

class ThumbnailCell: UICollectionViewCell {
    static let reuseIdentifier = "ThumbnailCell"
    
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 2.0
        return imgView
    }()
    
    func configure(screenshotUrlString: String) {
        addSubview(imgView)
        imgView.loadImageWithUrlString(urlString: screenshotUrlString)
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
    }

}
