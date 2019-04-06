//
//  UsersListViewController.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 05/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import UIKit

protocol UserListDisplayLogic: class {
    func render(_ viewModels: [UserDetailViewModel])
}

class UsersListViewController: UIViewController {
    var interactor: UserListBusinessLogic?
    
    var users: [UserDetailViewModel] = []
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.tableHeaderView = UISearchBar(placeholder: "users")
        tableView.register(UserListItemCell.self)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraits()
        
        interactor?.viewDidLoad()
    }
    
     init(dexId: String) {
        super.init(nibName: nil, bundle: nil)
        makeModules(dexId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeModules(_ dexId: String) {
        let interactor = UserListInteractor(dexId: dexId)
        interactor.controller = self
        self.interactor = interactor
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        // test code
        let bbi = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didRequestMore))
        navigationItem.setRightBarButton(bbi, animated: true)
    }
    
    func setupConstraits() {
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    @objc func didRequestMore() {
        interactor?.loadMoreData()
    }
}

extension UsersListViewController: UserListDisplayLogic {
    func render(_ viewModels: [UserDetailViewModel]) {
        self.users = viewModels
        self.tableView.reloadData()
    }
}

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserListItemCell = tableView.dequeueReusableCell(indexPath)
        let viewModel = users[indexPath.row]
        cell.render(viewModel)
        return cell
    }
}
