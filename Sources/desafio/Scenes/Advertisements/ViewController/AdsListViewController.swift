//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit
import NetworkLayer

protocol AdsListDisplayLogic {
    func displayAdsList()
    func displayErrorOnLoadAdsList()
}

final class AdsListViewController: UIViewController {

    // MARK: properties

    var ads: [Ad] = []
    
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
    
    var interactor: AdsBusinessLogic?
    let repository: AdsRepository = APIAdsRepository(networkService: URLSessionProvider())
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

    convenience init(interactor: AdsBusinessLogic?) {
        self.init(nibName: nil, bundle: nil)
        self.interactor = interactor
    }
    
    private func getAds() {
//        interactor?.getAds(
//            limit: filter.limit,
//            region: filter.region,
//            sort: filter.sort,
//            state: filter.state,
//            language: filter.language
//        )
        
        repository.getAds(limit: filter.limit, region: filter.region, sort: filter.sort, state: filter.state, language: filter.language) { result in

            switch result {
            case .success(let data):
                self.ads = data.listAds ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
