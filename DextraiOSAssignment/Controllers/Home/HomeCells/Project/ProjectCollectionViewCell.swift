//
//  ProjectCollectionViewCell.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 06/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraits()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageUrl: URL?) {
        self.imageView.kf.setImage(with: imageUrl)
    }
    
    func setupViews() {
        self.contentView.addSubview(imageView)
    }
    
    func setupConstraits() {
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
