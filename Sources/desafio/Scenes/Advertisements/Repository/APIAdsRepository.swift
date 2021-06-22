//
//  APIAdsRepository.swift
//  desafio
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation
import NetworkLayer

protocol AdsRepository {
    func getAds(limit: String, region: String, sort: String, state: String, language: String, result: @escaping ResultHandler<ListAds>)
}

final class APIAdsRepository {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    private func makeAdvertisementEndpoint(
        limit: String = "",
        region: String = "",
        sort: String = "",
        state: String = "",
        language: String = ""
    ) -> AdvertisementsEndpoint {
        
        return AdvertisementsEndpoint(
            limit: limit,
            region: region,
            sort: sort,
            state: state,
            language: language
        )
    }
    
    private func makeListAds(from dto: ListAdsDTO) -> ListAds {
        return ListAdsDTOMapper.map(dto)
    }
}

extension APIAdsRepository: AdsRepository {
    func getAds(
        limit: String = "",
        region: String = "",
        sort: String = "",
        state: String = "",
        language: String = "",
        result: @escaping ResultHandler<ListAds>
    ) {
        let endpoint = makeAdvertisementEndpoint(
            limit: limit,
            region: region,
            sort: sort,
            state: state,
            language: language
        )
        
        networkService.performRequest(endpoint: endpoint, using: .convertFromSnakeCase) { (value: Result<ListAdsDTO, NetworkError>) in
            
            switch value {
            case .success(let data):
                let listAds = self.makeListAds(from: data)
                result(.success(listAds))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
