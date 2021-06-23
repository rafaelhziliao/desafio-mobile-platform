//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit

protocol AdsListDisplayLogic: AnyObject {
    func displayAdsList(_ ads: [Ad])
    func displayErrorOnLoadAdsList(_ error: String)
}

final class AdsListViewController: UIViewController {

    // MARK: properties

    var ads: [Ad] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = AdListViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .lightGray
        collectionView.clipsToBounds = true
        collectionView.isOpaque = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerNib(AdListCardViewCell.self)
        return collectionView
    }()
    
    var interactor: AdsListBusinessLogic?
    
    // Supposing this data is comming from user interaction
    let filter = (
        limit: "25",
        region: "11",
        sort: "relevance",
        state: "1",
        language: "pt"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        getAds()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(interactor: AdsListBusinessLogic?) {
        self.init(nibName: nil, bundle: nil)
        self.interactor = interactor
    }
    
    private func getAds() {
        interactor?.getAds(
            limit: filter.limit,
            region: filter.region,
            sort: filter.sort,
            state: filter.state,
            language: filter.language
        )
    }
}

// MARK: ViewCoding

extension AdsListViewController: ViewCoding {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.safeAreaTop(safeAreaView: view)
        collectionView.rightConstraint(parentView: view)
        collectionView.leftConstraint(parentView: view)
        collectionView.bottomConstraint(parentView: view)
    }
    
    func additionalSetup() {
        view.backgroundColor = .systemBackground
    }
}

// MARK: Display Logic

extension AdsListViewController: AdsListDisplayLogic {
    func displayAdsList(_ ads: [Ad]) {
        self.ads = ads
    }
    
    func displayErrorOnLoadAdsList(_ error: String) {
        print(error)
    }
}

// MARK: UICollectionViewDataSource

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AdListCardViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(ad: ads[indexPath.row])
        return cell
    }
}
