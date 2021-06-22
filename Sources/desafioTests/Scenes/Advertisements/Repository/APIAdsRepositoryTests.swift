//
//  APIAdsRepositoryTests.swift
//  desafioTests
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

@testable import desafio
import XCTest
import NetworkLayer

class APIAdsRepositoryTests: XCTestCase {
    
    // MARK: Spy
    
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
    
    // MARK: Subject under test
    
    var networkSpy: NetworkProviderSpy = NetworkProviderSpy()
    var sut: APIAdsRepository!
    
    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        sut = APIAdsRepository(networkService: networkSpy)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_getAds_onSuccess() {
        // Given
        let responseMock = Bundle(for: type(of: self)).decode(ListAdsDTO.self, from: "ads_lim_25_region_11_sort_relevance_state_1_lang_pt.json", keyDecodingStrategy: .convertFromSnakeCase)
        
        networkSpy.requestResult = .success(responseMock)
    
        // When
        sut.getAds(limit: "25", region: "11", sort: "relevance", state: "1", language: "pt") { _ in }
        
        // Then
        XCTAssertEqual(try networkSpy.requestResult.get().listAds?.count, 25)
    }
}
