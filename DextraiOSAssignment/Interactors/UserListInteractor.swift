//
//  UserListInteractor.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

protocol UserListBusinessLogic {
    func viewDidLoad()
    func loadMoreData()
}

class UserListInteractor: UserListBusinessLogic {
    weak var controller: UserListDisplayLogic?
    let dexId: String
    var users: [UserDetail] = []
    var viewModels: [UserDetailViewModel] = []
    // save ref for next page
    var nextQuery: String?
    
    init(dexId: String) {
        self.dexId = dexId
    }
    
    func viewDidLoad() {
        fetchData()
    }
    
    func loadMoreData() {
        if let next = nextQuery {
            fetchData(next)
        } else {
            // tell controller that no more data is there.
        }
    }
}

extension UserListInteractor {
    private func fetchData(_ query: String? = nil) {
        var finalQuery: String
        if let query = query {
            finalQuery = query
        } else {
            finalQuery = "?dexId=\(dexId)"
        }
    
        DextraApi.usersListGET(query: finalQuery)
            .done { response in
                self.handleResponse(response)
                self.controller?.render(self.viewModels)
            }.catch { print($0) }
    }
    
    private func handleResponse(_ response: UsersResponse) {
        nextQuery = response.next
        let users = response.users ?? []
        self.users.append(contentsOf: users)
        self.viewModels = makeViewModels(self.users)
    }
    
    private func makeViewModels(_ users: [UserDetail]) -> [UserDetailViewModel] {
        return users
            .compactMap { UserDetailViewModel(
                            imageURL: $0.imageUrl,
                            firstName: $0.firstName,
                            lastName: $0.lastName,
                            claps: $0.totalProjectClaps)
        }
    }
}
