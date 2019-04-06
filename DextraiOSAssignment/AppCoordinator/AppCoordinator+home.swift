//
//  AppCoordinator+UsersList.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 06/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//
import Foundation
import UIKit

extension AppCoordinator: HomeControllerDelegate {
    func homeController(_ controller: HomeController, didSelectDex dexId: String) {
        let userListsController = UsersListViewController(dexId: dexId)
        controller.navigationController?.pushViewController(userListsController, animated: true)
    }
}
