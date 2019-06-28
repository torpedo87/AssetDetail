//
//  ViewController.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var viewModel: AssetDetailRepresentable
    private let descriptionLayoutGuide = UILayoutGuide()
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 32/255, green: 36/255, blue: 44/255, alpha: 1.0)
        return view
    }()
    private lazy var playerView: PlayerView = {
        let view = PlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        let img = UIImage(named: "btnStoreCloseNormal")
        button.setImage(img, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var userImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "btn_store_my-asset_normal")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    private lazy var priceTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(UIColor(red: 21/255, green: 25/255, blue: 34/255, alpha: 1.0), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 5
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 193/255, green: 196/255, blue: 299/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var customLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: customLayout)
        view.dataSource = self
        view.register(ThumbnailCell.self, forCellWithReuseIdentifier: ThumbnailCell.reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    init(viewModel: AssetDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWithViewModel()
        setupUI()
    }
    
    func configureWithViewModel() {
        topLabel.text = viewModel.categoryText
        sizeLabel.text = viewModel.sizeText
        titleLabel.text = viewModel.titleText
        categoryLabel.text = viewModel.categoryText
        priceTypeLabel.text = viewModel.priceTypeText
        descriptionLabel.text = viewModel.descriptionText
        playerView.play(urlString: viewModel.previewUrlstring)
    }

    func setupUI() {
        view.backgroundColor = UIColor(red: 233/255, green: 236/255, blue: 239/255, alpha: 1.0)
        view.addSubview(topView)
        topView.addSubview(backButton)
        topView.addSubview(topLabel)
        topView.addSubview(userImgView)
        view.addSubview(collectionView)
        view.addSubview(lineView)
        view.addLayoutGuide(descriptionLayoutGuide)
        view.addSubview(playerView)
        view.addSubview(titleLabel)
        infoStackView.addArrangedSubview(categoryLabel)
        infoStackView.addArrangedSubview(priceTypeLabel)
        infoStackView.addArrangedSubview(sizeLabel)
        view.addSubview(infoStackView)
        view.addSubview(downloadButton)
        view.addSubview(descriptionLabel)
        
        let screenHight: CGFloat = UIScreen.main.bounds.height
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(42)
        }
        
        playerView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(28)
            make.leading.equalTo(collectionView)
            make.bottom.equalTo(lineView.snp.top).offset(-20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(28)
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide).offset(-28)
            make.top.equalTo(lineView.snp.bottom).offset(20)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(collectionView)
            make.height.equalTo(1)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-(screenHight-42)*2/5)
        }
        
        descriptionLayoutGuide.snp.makeConstraints { make in
            make.leading.equalTo(playerView.snp.trailing).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-28)
            make.bottom.equalTo(lineView.snp.top).offset(-20)
            make.top.equalTo(topView.snp.bottom).offset(28)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.trailing.top.leading.equalTo(descriptionLayoutGuide)
            make.height.equalTo(35)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.trailing.equalTo(descriptionLayoutGuide)
            make.width.equalTo(90)
            make.height.equalTo(23)
            make.centerY.equalTo(infoStackView)
        }
        
        infoStackView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.centerY.equalTo(downloadButton)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalTo(descriptionLayoutGuide)
            make.top.equalTo(infoStackView.snp.bottom).offset(10)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.bottom.leading.equalTo(topView)
            make.width.equalTo(backButton.snp.height)
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(topView)
            make.width.equalTo(200)
            make.leading.equalTo(backButton.snp.trailing).offset(8)
        }
        
        userImgView.snp.makeConstraints { make in
            make.width.equalTo(userImgView.snp.height)
            make.trailing.bottom.equalTo(topView).offset(-4)
            make.top.equalTo(topView).offset(4)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let ratio: CGFloat = 16.0/9.0
        let height: CGFloat = collectionView.bounds.size.height
        customLayout.itemSize = CGSize(width: height*ratio,
                                       height: height)
        
        playerView.snp.makeConstraints { make in
            make.width.equalTo(playerView.frame.height * 280 / 157)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.thumbNailUrlstrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.reuseIdentifier,
                                                         for: indexPath) as? ThumbnailCell {
            let urlString = viewModel.thumbNailUrlstrings[indexPath.item]
            cell.configure(screenshotUrlString: urlString)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
