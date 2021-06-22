//
//  AdsInteractor.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

protocol AdsBusinessLogic {
    func getAds(limit: String, region: String, sort: String, state: String, language: String)
}

final class AdsInteractor {
    let repository: AdsRepository
    let presenter: AdsPresentationLogic
    
    init(repository: AdsRepository, presenter: AdsPresentationLogic) {
        self.repository = repository
        self.presenter = presenter
    }
}

extension AdsInteractor: AdsBusinessLogic {
    func getAds(limit: String, region: String, sort: String, state: String, language: String) {
        repository.getAds(limit: limit, region: region, sort: sort, state: state, language: language) { [weak self] response in
            
            switch response {
            case .success(let ads):
                self?.presenter.presentAdsList(ads)
            case .failure(let error):
                self?.presenter.presentErrorOnLoadAdsList(error.localizedDescription)
            }
        }
    }
}
