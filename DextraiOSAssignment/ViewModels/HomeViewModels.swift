//
//  HomeViewModels.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

protocol ViewModelType { }

struct SectionViewModel {
    let title: String
    let type: SectionType
    let entities: [ViewModelType]
}

struct RequirementViewModel: ViewModelType {
    let imageRatio: Double?
    let imageUrl: URL?
}

struct BannerViewModel: ViewModelType {
    let imageUrl: URL?
    let actionUrl: URL?
}

struct UserViewModel: ViewModelType {
    let imageUrl: URL?
    let lastName: String?
    let firstName: String?
}

struct DexViewModel: ViewModelType {
    let id: String?
    let imageUrl: URL?
    let userTerm: String?
}

struct ProjectViewModel: ViewModelType {
    let imageUrl: URL?
}
