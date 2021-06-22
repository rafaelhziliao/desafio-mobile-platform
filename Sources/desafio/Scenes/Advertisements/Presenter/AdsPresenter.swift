//
//  AdsPresenter.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

protocol AdsPresentationLogic {
    func presentAdsList(_ ads: ListAds)
    func presentErrorOnLoadAdsList(_ error: String)
}

final class AdsPresenter {
    
}

extension AdsPresenter: AdsPresentationLogic {
    func presentAdsList(_ ads: ListAds) {
        print("Display ads in viewcontroller: \(ads)")
    }
    
    func presentErrorOnLoadAdsList(_ error: String) {
        print("Request error \(error)")
    }
}
