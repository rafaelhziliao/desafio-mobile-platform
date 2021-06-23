//
//  AdsListInteractorTests.swift
//  desafioTests
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

@testable import desafio
import XCTest
import NetworkLayer

class AdsListInteractorTests: XCTestCase {

    // MARK: Spy    
    class AdsListPresenterSpy: AdsListPresentationLogic {
        weak var viewController: AdsListDisplayLogic?
        var presentAdsListCalled = false
        var presentErrorOnLoadAdsListCalled = false

        func presentAdsList(_ ads: [Ads]?) {
            presentAdsListCalled = true
        }

        func presentErrorOnLoadAdsList(_ error: String) {
            presentErrorOnLoadAdsListCalled = true
        }
    }

    // MARK: Subject under test

    var repositorySpy: APIAdsListRepositorySpy = APIAdsListRepositorySpy()
    var presenterSpy: AdsListPresenterSpy = AdsListPresenterSpy()
    var sut: AdsListInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        sut = AdsListInteractor(repository: repositorySpy, presenter: presenterSpy)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_getAds_onSuccess_call_presentAds() {
        // Given
        repositorySpy.requestResult = .success(repositorySpy.listAdsMock)

        // When
        sut.getAds(limit: "25", region: "11", sort: "relevance", state: "1", language: "pt")

        // Then
        XCTAssertTrue(presenterSpy.presentAdsListCalled)
    }

    func test_getAds_onFailure_call_presentErrorOnLoadAdsList() {
        // Given
        repositorySpy.requestResult = .failure(.noJSONData)

        // When
        sut.getAds(limit: "25", region: "11", sort: "relevance", state: "1", language: "pt")

        // Then
        XCTAssertTrue(presenterSpy.presentErrorOnLoadAdsListCalled)
    }
}
