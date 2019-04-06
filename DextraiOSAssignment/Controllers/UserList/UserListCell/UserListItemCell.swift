//
//  UserListItemCell.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 05/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit

class UserListItemCell: UITableViewCell {
    lazy var userImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.backgroundColor = UIColor.flatTeal
        return imageView
    }()
    
    lazy var lastNameLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(14)
        return label
    }()
    
    lazy var firstNameLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(14)
        return label
    }()
    
    lazy var clapsLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraits()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func setupViews() {
        self.contentView.addSubview(userImageView)
        self.contentView.addSubview(firstNameLabel)
        self.contentView.addSubview(lastNameLabel)
        self.contentView.addSubview(clapsLabel)
    }
    
    func setupConstraits() {
        userImageView.snp.makeConstraints { (make) in
            make.size.equalTo(50)
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(80)
        }
        
        firstNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userImageView.snp.bottom).offset(2)
            make.centerX.equalTo(userImageView.snp.centerX)
        }
        
        lastNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(2)
            make.centerX.equalTo(userImageView.snp.centerX)
        }
        
        clapsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(2)
            make.centerX.equalTo(userImageView.snp.centerX)
            make.bottom.equalToSuperview().inset(8)
        }
    }
}

extension UserListItemCell {
    func render(_ viewModel: UserDetailViewModel) {
        self.userImageView.kf.setImage(with: viewModel.imageURL)
        firstNameLabel.text = viewModel.firstName
        lastNameLabel.text = viewModel.lastName
        let claps = String(viewModel.claps ?? 0)
        clapsLabel.text = "claps \(claps)"
    }
}
