//
//  ViewController.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit
import SnapKit

enum SectionType: String {
    case dex = "dex"
    case user = "user"
    case requirement = "requirement"
    case banner = "banner"
    case project = "project"
    case none
}

protocol HomeControllerDelegate: class {
    func homeController(_ controller: HomeController, didSelectDex dexId: String)
}

protocol HomeDisplayLogic: class {
    func render(_ viewModels: [SectionViewModel])
}

class HomeController: UIViewController {
    var interactor: HomeBusinessLogic?
    
    weak var delegate: HomeControllerDelegate?
    var sections: [SectionViewModel] = []

    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.tableHeaderView = UISearchBar(placeholder: "explore")
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .onDrag
        tableView.register(RequirementCell.self)
        tableView.register(BannerCell.self)
        tableView.register(DexCell.self)
        tableView.register(UserCell.self)
        tableView.register(ProjectCell.self)
        return tableView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        makeModules()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeModules() {
        let interactor = HomeInterator()
        interactor.controller = self
        
        self.interactor = interactor
    }
}

extension HomeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        interactor?.viewDidLoad()
    }
    
    func setUpViews() {
        self.view.addSubview(tableView)
        self.view.backgroundColor = .white
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension HomeController: HomeDisplayLogic {
    func render(_ viewModels: [SectionViewModel]) {
        self.sections = viewModels
        self.tableView.reloadData()
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionViewModel = sections[indexPath.row]
        
        switch sectionViewModel.type {
        case .requirement:
            let cell: RequirementCell = tableView.dequeueReusableCell(indexPath)
            cell.render(sectionViewModel)
            return cell
        case .dex:
            let cell: DexCell = tableView.dequeueReusableCell(indexPath)
            cell.render(sectionViewModel)
            cell.delegate = self
            return cell
        case .banner:
            let cell: BannerCell = tableView.dequeueReusableCell(indexPath)
            cell.render(sectionViewModel)
            return cell
        case .user:
            let cell: UserCell = tableView.dequeueReusableCell(indexPath)
            cell.render(sectionViewModel)
            return cell
        case .project:
            let cell: ProjectCell = tableView.dequeueReusableCell(indexPath)
            cell.render(sectionViewModel)
            return cell
        default:
            fatalError("Cell type not configured")
        }
    }
}

extension HomeController: DexSectionDelegate {
    func didSelectItemIdFromDexCollection(_ id: String) {
        self.delegate?.homeController(self, didSelectDex: id)
    }
}
