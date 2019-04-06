//
//  ApiConstants.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

class ApiEndpoint {
    static let dextraUrlString = "https://valakt.dextra.com/explore"
    static let dextraUsersUrlString = "https://valakt.dextra.com/explore/user"
}

enum ApiError: Error {
    case invalidUrl
    case custom(String)
    case noResult
    case parsing
}
