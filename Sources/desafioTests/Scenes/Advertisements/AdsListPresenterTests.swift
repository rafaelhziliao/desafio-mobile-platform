//
//  AdsListPresenterTests.swift
//  desafioTests
//
//  Created by rafael zilao on 23/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

@testable import desafio
import XCTest
import NetworkLayer

class AdsListPresenterTests: XCTestCase {

    // MARK: Spy
    class AdsListViewControllerSpy: AdsListDisplayLogic {
        var displayAdsListCalled = false
        var displayErrorOnLoadAdsListCalled = false

        func displayAdsList(_ ads: [Ads]) {
            displayAdsListCalled = true
        }

        func displayErrorOnLoadAdsList(_ error: String) {
            displayErrorOnLoadAdsListCalled = true
        }
    }

    // MARK: Subject under test
    var viewControllerSpy: AdsListViewControllerSpy = AdsListViewControllerSpy()
    var sut: AdsListPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        sut = AdsListPresenter()
        sut.viewController = viewControllerSpy
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_presentAdsList() {
        // Given
        let ads = APIAdsListRepositorySpy().listAdsMock.listAds

        // When
        sut.presentAdsList(ads)

        // Then
        XCTAssertTrue(viewControllerSpy.displayAdsListCalled)
    }

    func test_getAds_onFailure_call_presentErrorOnLoadAdsList() {
        // Given
        let error = NetworkError.noJSONData

        // When
        sut.presentErrorOnLoadAdsList(error.localizedDescription)

        // Then
        XCTAssertTrue(viewControllerSpy.displayErrorOnLoadAdsListCalled)
    }
}
