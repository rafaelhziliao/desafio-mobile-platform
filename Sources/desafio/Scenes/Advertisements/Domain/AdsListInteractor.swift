//
//  AdsListInteractor.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

protocol AdsListBusinessLogic {
    func getAds(limit: String, region: String, sort: String, state: String, language: String)
}

final class AdsListInteractor {
    let repository: AdsListRepository
    let presenter: AdsListPresentationLogic
    
    init(repository: AdsListRepository, presenter: AdsListPresentationLogic) {
        self.repository = repository
        self.presenter = presenter
    }
}

extension AdsListInteractor: AdsListBusinessLogic {
    func getAds(limit: String, region: String, sort: String, state: String, language: String) {
        
        repository.getAds(limit: limit, region: region, sort: sort, state: state, language: language) { [weak self] response in
            
            switch response {
            case .success(let ads):
                self?.presenter.presentAdsList(ads.listAds)
            case .failure(let error):
                self?.presenter.presentErrorOnLoadAdsList(error.localizedDescription)
            }
        }
    }
}
