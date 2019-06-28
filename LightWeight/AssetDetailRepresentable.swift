//
//  AssetDetailRepresentable.swift
//  LightWeight
//
//  Created by DOMINICO1 on 28/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import Foundation

protocol AssetDetailRepresentable {
    var descriptionText: String { get }
    var thumbNailUrlstrings: [String] { get }
    var previewUrlstring: String { get }
    var sizeText: String { get }
    var titleText: String { get }
    var categoryText: String { get }
    var priceTypeText: String { get }
}
