//
//  Asset.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import Foundation

class Asset {
    
    let assetTitle: String
    let assetCategoryType: CategoryType
    let assetSize: Int64
    let assetDescription: String
    let assetThumbnailUrlstrings: [String]
    let assetPreviewUrlstring: String
    let assetPriceType: PriceType
    
    enum PriceType: String {
        case premium
        case free
        case paid
    }
    
    enum CategoryType: String {
        case audio
        case background
        case effect
        case filter
        case audiofilter
        case font
        case overlay
        case template
        case transition
    }
    
    init(title: String, category: CategoryType, size: Int64, description: String, thumbnailUrlstrings: [String], previewUrlstring: String, priceType: PriceType) {
        self.assetTitle = title
        self.assetCategoryType = category
        self.assetPriceType = priceType
        self.assetSize = size
        self.assetDescription = description
        self.assetThumbnailUrlstrings = thumbnailUrlstrings
        self.assetPreviewUrlstring = previewUrlstring
    }
}
