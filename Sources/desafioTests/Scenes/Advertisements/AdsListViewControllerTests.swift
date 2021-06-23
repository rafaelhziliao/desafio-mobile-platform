//
//  AdsListViewControllerTests.swift
//  desafioTests
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

@testable import desafio
import XCTest

class AdsListViewControllerTests: XCTestCase {

    // MARK: Subject under test

    class AdsListInteractorSpy: AdsListBusinessLogic {
        var getAdsCalled = false

        func getAds(limit: String, region: String, sort: String, state: String, language: String) {
            getAdsCalled = true
        }
    }

    class CollectionViewSpy: UICollectionView {
        var reloadDataCalled = false

        override func reloadData() {
            reloadDataCalled = true
        }
    }

    // MARK: Subject under test

    var sut: AdsListViewController!
    var interactor: AdsListInteractorSpy = AdsListInteractorSpy()
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        sut = AdsListViewController(interactor: interactor)
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    func test_getAdsCalled_when_view_isLoaded() {
        // When
        loadView()

        // Then
        XCTAssertTrue(interactor.getAdsCalled)
    }

    func test_DisplayAdsList() {
        // Given
        let ads = APIAdsListRepositorySpy().listAdsMock.listAds ?? []
        let collectionViewSpy = CollectionViewSpy(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        sut.collectionView = collectionViewSpy

        // When
        sut.displayAdsList(ads)

        // Then
        XCTAssertTrue(collectionViewSpy.reloadDataCalled)
    }

    func test_numberOfRows_isEqual_of_dataSource_count() {
        // Given
        let collectionView = sut.collectionView
        sut.ads = APIAdsListRepositorySpy().listAdsMock.listAds ?? []

        // When
        let numberOfRows = sut.collectionView(collectionView, numberOfItemsInSection: .zero)

        // Then
        XCTAssertEqual(numberOfRows, sut.ads.count)
    }

    func test_ConfigureCell() {
        // Given
        let collectionView = sut.collectionView
        sut.ads = APIAdsListRepositorySpy().listAdsMock.listAds ?? []

        // When
        let indexPath = IndexPath(row: .zero, section: .zero)
        let cell = sut.collectionView(collectionView, cellForItemAt: indexPath) as? AdListCardViewCell

        // Then
        XCTAssertEqual(cell?.titleLabel.text, "Casio  aw 82  fishing gear (pescaria)")
    }

}
