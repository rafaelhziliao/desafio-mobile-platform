//
//  APIAdsListRepositorySpy.swift
//  desafioTests
//
//  Created by rafael zilao on 23/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation
import NetworkLayer
@testable import desafio

class APIAdsListRepositorySpy: AdsListRepository {
    var requestResult: Result<ListAds, NetworkError> = .failure(.noJSONData)
    var listAdsMock: ListAds {
        let listAdsDTO = Bundle(for: type(of: self)).decode(
            ListAdsDTO.self,
            from: "ads_lim_25_region_11_sort_relevance_state_1_lang_pt.json",
            keyDecodingStrategy: .convertFromSnakeCase
        )
        
        return ListAdsDTOMapper.map(listAdsDTO)
    }

    func getAds(limit: String, region: String, sort: String, state: String, language: String, result: @escaping ResultHandler<ListAds>) {
        result(requestResult)
    }
}
