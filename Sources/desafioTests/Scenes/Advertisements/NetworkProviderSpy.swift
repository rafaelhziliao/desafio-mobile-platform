//
//  NetworkProviderSpy.swift
//  desafioTests
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation
import NetworkLayer
@testable import desafio

class NetworkProviderSpy: NetworkService {
    var requestResult: Result<ListAdsDTO, NetworkError> = .failure(.noJSONData)
    
    func performRequest<T: Decodable>(
        endpoint: Endpoint,
        using keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
        result: @escaping ResultHandler<T>
    ) {
        
        switch requestResult {
        case let .success(ads):
            //swiftlint:disable:next force_cast
            result(.success(ads as! T))
        case let .failure(error):
            result(.failure(error))
        }
    }
}
