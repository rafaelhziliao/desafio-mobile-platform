//
//  AdsListViewControllerFactory.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import UIKit
import NetworkLayer

final class AdsListViewControllerFactory {
    class func make(with dataSource: AdsListRepository = APIAdsListRepository(networkService: URLSessionProvider())) -> AdsListViewController {
        
        let presenter: AdsListPresentationLogic = AdsListPresenter()
        let interactor: AdsListBusinessLogic = AdsListInteractor(repository: dataSource, presenter: presenter)
        
        return AdsListViewController(interactor: interactor)
    }
}
