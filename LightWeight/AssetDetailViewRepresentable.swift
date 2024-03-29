//
//  AssetDetailViewRepresentable.swift
//  LightWeight
//
//  Created by junwoo on 2019/06/27.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct AssetDetailViewRepresentable: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: UIViewRepresentableContext<AssetDetailViewRepresentable>) -> AssetDetailViewRepresentable.UIViewType {
        let mockAsset = Asset(title: "title",
                              category: .overlay,
                              size: 100000000,
                              description: "fdsfdsfdsfdsfdsfsdfafdasfdsfdsfdsafadsfsdfsdafsdfdsafdsafdsafdsafdsafdsfdsfdsafadsfdsfdsfadfadsfdsafdasfdasfdsfdsafsafdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsf",
                              thumbnailUrlstrings: ["https://www.textuar.com/blog/wp-content/uploads/2017/11/free-images-for-copywriting.jpg", "https://www.textuar.com/blog/wp-content/uploads/2017/11/free-images-for-copywriting.jpg", "https://www.textuar.com/blog/wp-content/uploads/2017/11/free-images-for-copywriting.jpg", "https://www.textuar.com/blog/wp-content/uploads/2017/11/free-images-for-copywriting.jpg", "https://www.textuar.com/blog/wp-content/uploads/2017/11/free-images-for-copywriting.jpg"],
                              previewUrlstring: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4",
                              priceType: .premium)
        let viewModel = AssetDetailViewModel(asset: mockAsset)
        return ViewController(viewModel: viewModel).view
    }

    func updateUIView(_ uiView: AssetDetailViewRepresentable.UIViewType, context: UIViewRepresentableContext<AssetDetailViewRepresentable>) {

    }
}

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AssetDetailViewRepresentable()
                .previewLayout(.fixed(width: 568, height: 320))
                .previewDisplayName("iPhone SE")

            AssetDetailViewRepresentable()
                .previewLayout(.fixed(width: 896, height: 414))
                .previewDisplayName("iPhone XS Max")

            AssetDetailViewRepresentable()
                .previewLayout(.fixed(width: 1366, height: 1024))
                .previewDisplayName("iPad Pro (12.9-inch)")
        }

    }
}

#endif
