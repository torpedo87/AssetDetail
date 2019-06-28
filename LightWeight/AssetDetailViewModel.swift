//
//  AssetDetailViewModel.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import Foundation

struct AssetDetailViewModel: AssetDetailRepresentable {
    
    let asset: Asset
    
    var sizeText: String {
        return AssetDetailViewModel.byteCountFormatter.string(fromByteCount: asset.assetSize)
    }
    var titleText: String {
        return asset.assetTitle
    }
    var categoryText: String {
        return asset.assetCategoryType.rawValue
    }
    var priceTypeText: String {
        return asset.assetPriceType.rawValue
    }
    
    static let byteCountFormatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .binary
        formatter.allowedUnits = .useMB
        formatter.isAdaptive = true
        return formatter
    }()
    
    var descriptionText: String {
        return asset.assetDescription
    }
    
    var thumbNailUrlstrings: [String] {
        return asset.assetThumbnailUrlstrings
    }
    
    var previewUrlstring: String {
        return asset.assetPreviewUrlstring
    }
    
    init(asset: Asset) {
        self.asset = asset
    }
}
