//
//  APIAdsRepositoryTests.swift
//  desafioTests
//
//  Created by rafael ziliao on 21/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

@testable import desafio
import XCTest

class APIAdsListRepositoryTests: XCTestCase {

    // MARK: Subject under test

    var networkSpy: NetworkProviderSpy = NetworkProviderSpy()
    var sut: APIAdsListRepository!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        sut = APIAdsListRepository(networkService: networkSpy)
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

    func test_getAds_Map_ListAdsDTO_to_ListAds() {
        // Given
        let responseMock = Bundle(for: type(of: self)).decode(ListAdsDTO.self, from: "ads_lim_25_region_11_sort_relevance_state_1_lang_pt.json", keyDecodingStrategy: .convertFromSnakeCase)

        var listAds: ListAds?

        networkSpy.requestResult = .success(responseMock)

        // When
        sut.getAds(limit: "25", region: "11", sort: "relevance", state: "1", language: "pt") { result in
            if case .success(let ads) = result {
                listAds = ads
            }
        }

        // Then
        XCTAssertEqual(try networkSpy.requestResult.get().listAds?.count, listAds?.listAds?.count)
    }

}
