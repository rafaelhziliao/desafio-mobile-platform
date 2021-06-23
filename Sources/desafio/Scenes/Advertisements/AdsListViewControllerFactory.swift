//
//  AdsListViewControllerFactory.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import UIKit
import NetworkLayer

class AdsListViewControllerFactory {
    class func make(with dataSource: AdsRepository = APIAdsRepository(networkService: URLSessionProvider())) -> AdsListViewController {
        
        let presenter: AdsPresentationLogic = AdsPresenter()
        let interactor: AdsBusinessLogic = AdsInteractor(repository: dataSource, presenter: presenter)
        
        return AdsListViewController(interactor: interactor)
    }
}


