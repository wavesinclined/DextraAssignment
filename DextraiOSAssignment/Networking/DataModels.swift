//
//  DataModels.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

struct ExploreResponse: Decodable {
    let explore: [Explore]?
}

struct Explore: Decodable {
    let title: String?
    let sectionType: String?
    let isTop: Bool?
    let entities: [Entity]?
}

struct Entity: Decodable {
    let id: String?
    let imageUrl: URL?
    let actionUrl: URL?
    let handle: String?
    let firstName: String?
    let lastName: String?
    let name: String?
    let userTermSlug: String?
    let userTerm: String?
    
    let totalProjectClaps: Int?
    let claps: Int?
    
    let imageRatio: Double?
    
    let dex: RequirementDex?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case imageUrl
        case imageRatio
        case actionUrl
        case dex
        case handle
        case firstName
        case lastName
        case totalProjectClaps
        case claps
        case name
        case userTermSlug
        case userTerm
    }
}

extension Entity {
    func project() -> Project {
        return Project(id: id,
                       name: name,
                       type: nil,
                       imageRatio: imageRatio,
                       imageUrl: imageUrl,
                       claps: claps)
    }
    
    func user() -> User {
        return User(id: id,
                    handle: handle,
                    firstName: firstName,
                    lastName: lastName,
                    imageUrl: imageUrl,
                    totalProjectClaps: totalProjectClaps)
    }
    
    func requirement() -> Requirement {
        return Requirement(id: id, dex: dex)
    }
    
    func banner() -> Banner {
        return Banner(imageUrl: imageUrl, actionUrl: actionUrl)
    }
}

struct Project {
    let id: String?
    let name: String?
    let type: String?
    let imageRatio: Double?
    let imageUrl: URL?
    let claps: Int?
}

struct User {
    let id: String?
    let handle: String?
    let firstName: String?
    let lastName: String?
    let imageUrl: URL?
    let totalProjectClaps: Int?
}

struct Requirement {
    let id: String?
    let dex: RequirementDex?
}

struct RequirementDex: Decodable {
    let id: String?
    let name: String?
    let userTerm: String?
    let imageRatio: Double?
    let imageUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case userTerm
        case imageRatio
        case imageUrl
    }
}

struct Banner {
    let imageUrl: URL?
    let actionUrl: URL?
}

struct Dex {
    let id: String?
    let name: String?
    let userTerm: String?
    let imageRatio: Double?
    let imageUrl: URL?
}

struct UsersResponse: Decodable {
    let users: [UserDetail]?
    let next: String?
}

struct UserDetail: Decodable {
    let id: String?
    let firstName: String?
    let lastName: String?
    let imageUrl: URL?
    let totalProjectClaps: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstName
        case lastName
        case imageUrl
        case totalProjectClaps
    }
}
