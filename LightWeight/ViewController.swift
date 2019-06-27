//
//  ViewController.swift
//  LightWeight
//
//  Created by DOMINICO1 on 26/06/2019.
//  Copyright © 2019 DOMINICO1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: AssetDetailViewModel
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
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        stack.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
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
        configure(viewModel)
        setupUI()
    }
    
    func configure(_ viewModel: AssetDetailViewModel) {
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
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 42),
            
            playerView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 28),
            playerView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            playerView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -20),
            playerView.widthAnchor.constraint(equalTo: playerView.heightAnchor, multiplier: 280/157),
            
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28),
            collectionView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20),
            
            lineView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(screenHight-42)*2/5),
            
            descriptionLayoutGuide.leadingAnchor.constraint(equalTo: playerView.trailingAnchor, constant: 20),
            descriptionLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            descriptionLayoutGuide.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -20),
            descriptionLayoutGuide.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 28),
            
            titleLabel.trailingAnchor.constraint(equalTo: descriptionLayoutGuide.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: descriptionLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: descriptionLayoutGuide.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
            
            downloadButton.trailingAnchor.constraint(equalTo: descriptionLayoutGuide.trailingAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 90),
            downloadButton.heightAnchor.constraint(equalToConstant: 23),
            downloadButton.centerYAnchor.constraint(equalTo: infoStackView.centerYAnchor),
            
            infoStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            infoStackView.centerYAnchor.constraint(equalTo: downloadButton.centerYAnchor),
            infoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -5),
            
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionLayoutGuide.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionLayoutGuide.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionLayoutGuide.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: topView.topAnchor),
            backButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            backButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            topLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
            topLabel.widthAnchor.constraint(equalToConstant: 200),
            topLabel.topAnchor.constraint(equalTo: topView.topAnchor),
            topLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            userImgView.widthAnchor.constraint(equalTo: userImgView.heightAnchor),
            userImgView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -4),
            userImgView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -4),
            userImgView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 4),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let ratio: CGFloat = 16.0/9.0
        let height: CGFloat = collectionView.bounds.size.height
        customLayout.itemSize = CGSize(width: height*ratio,
                                       height: height)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.thumbNailUrlstrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.reuseIdentifier, for: indexPath) as? ThumbnailCell {
            let urlString = viewModel.thumbNailUrlstrings[indexPath.item]
            cell.configure(screenshotUrlString: urlString)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
