//
//  BaseAPi.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import PromiseKit

class DextraApi {
    class func exploreGET() -> Promise<ExploreResponse> {
        guard let url = URL(string: ApiEndpoint.dextraUrlString) else { return Promise(error: ApiError.invalidUrl) }
        
        return get(url)
    }
    
    class func usersListGET(query: String) -> Promise<UsersResponse> {
        guard let url = URL(string: ApiEndpoint.dextraUsersUrlString + query) else { return Promise(error: ApiError.invalidUrl) }
        
        return get(url)
    }
}

func get<T: Decodable>(_ url: URL) -> Promise<T> {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    return URLSession
        .shared
        .dataTask(.promise, with: request)
        .map { try decode($0.data) }
}

func decode<T: Decodable>(_ data: Data) throws -> T {
    return try JSONDecoder().decode(T.self, from: data)
}
