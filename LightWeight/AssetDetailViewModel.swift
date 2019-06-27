//
//  AssetDetailViewModel.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import Foundation

struct AssetDetailViewModel {
    
    let asset: Asset
    let descriptionText: String
    let thumbNailUrlstrings: [String]
    let previewUrlstring: String
    let sizeText: String
    let titleText: String
    let categoryText: String
    let priceTypeText: String
    
    static let byteCountFormatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .binary
        formatter.allowedUnits = .useMB
        formatter.isAdaptive = true
        return formatter
    }()
    
    init(asset: Asset) {
        self.asset = asset
        self.previewUrlstring = asset.assetPreviewUrlstring
        descriptionText = asset.assetDescription
        thumbNailUrlstrings = asset.assetThumbnailUrlstrings
        sizeText = AssetDetailViewModel.byteCountFormatter.string(fromByteCount: asset.assetSize)
        titleText = asset.assetTitle
        categoryText = asset.assetCategoryType.rawValue
        priceTypeText = asset.assetPriceType.rawValue
    }
}
