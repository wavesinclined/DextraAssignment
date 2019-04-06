//
//  HomeInterator.swift
//  DextraiOSAssignment
//
//  Created by Jyotsna Singh on 04/04/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation


protocol HomeBusinessLogic {
    func viewDidLoad()
}

class HomeInterator: HomeBusinessLogic {
    weak var controller: HomeController?
    
    var results: [Explore] = []
    var viewModels: [SectionViewModel] = []
    
    func viewDidLoad() {
        fetchData()
    }
}

extension HomeInterator {
    private func fetchData() {
        DextraApi.exploreGET()
            .done { response in
                self.handleResponse(response)
                self.controller?.render(self.viewModels)
            }.catch { print($0) }
    }
    
    func handleResponse(_ response: ExploreResponse) {
        results = response.explore ?? []
        viewModels = makeSectionViewModels(results)
    }
    
    func makeSectionViewModels(_ results: [Explore]) -> [SectionViewModel] {
        let sections: [SectionViewModel] = results.map { explore in
            
            let title = explore.title ?? ""
            var entities: [ViewModelType] = []
            var type: SectionType = .none
            
            switch explore.sectionType {
            case SectionType.requirement.rawValue:
                type = .requirement
                entities = explore.entities?
                    .compactMap { RequirementViewModel(imageRatio: $0.dex?.imageRatio,
                                                       imageUrl: $0.dex?.imageUrl) } ?? []
            case SectionType.banner.rawValue:
                type = .banner
                entities = explore.entities?
                    .compactMap { BannerViewModel(imageUrl: $0.imageUrl,
                                                  actionUrl: $0.actionUrl)} ?? []
            case SectionType.dex.rawValue:
                type = .dex
                entities = explore.entities?
                    .compactMap { DexViewModel(id: $0.id, imageUrl: $0.imageUrl,
                                               userTerm: $0.userTerm)} ?? []
            case SectionType.user.rawValue:
                type = .user
                entities = explore.entities?
                    .compactMap { UserViewModel(imageUrl: $0.imageUrl,
                                                lastName: $0.lastName,
                                                firstName: $0.firstName)} ?? []
            case SectionType.project.rawValue:
                type = .project
                entities = explore.entities?
                    .compactMap { ProjectViewModel(imageUrl: $0.imageUrl)} ?? []
            default :
                break
            }
            
            return SectionViewModel(title: title,
                                    type: type,
                                    entities: entities)
        }
        
        return sections
    }
}
