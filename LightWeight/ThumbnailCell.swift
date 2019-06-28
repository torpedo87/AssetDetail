//
//  ThumbnailCell.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit
import SnapKit

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
    
    func configure(viewModel: AssetDetailRepresentable, index: Int) {
        let screenshotUrlString = viewModel.thumbNailUrlstrings[index]
        addSubview(imgView)
        imgView.loadImageWithUrlString(urlString: screenshotUrlString)
        
        imgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
    }

}
