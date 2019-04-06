//
//  DexCell.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework

protocol DexSectionDelegate: class {
    func didSelectItemIdFromDexCollection(_ id: String)
}

class DexCell: UITableViewCell {
    weak var delegate: DexSectionDelegate?
    var entities: [DexViewModel] = []
    
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
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DexCollectionViewCell.self)
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

extension DexCell {
    func render(_ viewModel: SectionViewModel) {
        guard let entities = viewModel.entities as? [DexViewModel] else { return }
        
        self.titleLabel.text = viewModel.title
        self.entities = entities
        self.collectionView.reloadData()
    }
}

extension DexCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DexCollectionViewCell = collectionView.dequeueReusableCell(indexPath)
        let entity = entities[indexPath.item]
        cell.configure(imageUrl: entity.imageUrl, userTerm: entity.userTerm)
        return cell
    }
}

extension DexCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entity = entities[indexPath.item]
        
        guard let id = entity.id else { return }
        self.delegate?.didSelectItemIdFromDexCollection(id)
    }
}
