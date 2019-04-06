//
//  ProjectCell.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 06/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

class ProjectCell: UITableViewCell {
    var entities: [ProjectViewModel] = []
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(16)
        return label
    }()
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: (self.contentView.frame.width - 10)/2.3, height: 120)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ProjectCollectionViewCell.self)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(collectionView)
    }
    
    func setUpConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.height.equalTo(130)
            make.bottom.equalToSuperview().inset(2)
        }
    }
}

extension ProjectCell {
    func render(_ viewModel: SectionViewModel) {
        guard let entities = viewModel.entities as? [ProjectViewModel] else { return }
        
        self.titleLabel.text = viewModel.title
        self.entities = entities
        self.collectionView.reloadData()
    }
}

extension ProjectCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProjectCollectionViewCell = collectionView.dequeueReusableCell(indexPath)
        let entity = entities[indexPath.item]
        cell.configure(imageUrl: entity.imageUrl)
        return cell
    }
}
