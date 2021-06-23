//
//  AdsListPresenter.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

protocol AdsListPresentationLogic {
    var viewController: AdsListDisplayLogic? { get set }
    func presentAdsList(_ ads: [Ad]?)
    func presentErrorOnLoadAdsList(_ error: String)
}

final class AdsListPresenter {
    weak var viewController: AdsListDisplayLogic?
}

extension AdsListPresenter: AdsListPresentationLogic {
    func presentAdsList(_ ads: [Ad]?) {
        viewController?.displayAdsList(ads ?? [])
    }
    
    func presentErrorOnLoadAdsList(_ error: String) {
        viewController?.displayErrorOnLoadAdsList(error)
    }
}
