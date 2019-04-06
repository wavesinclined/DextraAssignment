//
//  UserAvatarCell.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.backgroundColor = UIColor.flatTeal
        return imageView
    }()
    
    lazy var lastNameLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(10)
        label.textColor = UIColor.flatGrayDark
        return label
    }()
    
    lazy var firstNameLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraits()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageUrl: URL?, lastName: String?, firstName: String?) {
        self.imageView.kf.setImage(with: imageUrl)
        lastNameLabel.text = lastName ?? ""
        firstNameLabel.text = firstName  ?? ""
    }
    
    func setupViews() {
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(firstNameLabel)
        self.contentView.addSubview(lastNameLabel)
    }
    
    func setupConstraits() {
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview().offset(36)
        }
        
        firstNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.centerX.equalTo(imageView.snp.centerX)
        }
        
        lastNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(2)
            make.centerX.equalTo(imageView.snp.centerX)
        }
    }
}
