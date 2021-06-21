//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit
import NetworkLayer

class AdsListViewController: UIViewController {

    // MARK: properties

    var ads: [AdDTO] = []
    lazy private var flowLayout: AdListViewLayout = {
        let layout = AdListViewLayout()
        return layout
    }()

    // MARK: outlets

    @IBOutlet weak var adsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getAds()
    }

    // MARK: REST
    
    private func getAds() {
        
        let network = URLSessionProvider()
        
        let adsEndpoint = AdvertisementsEndpoint(
            limit: "25",
            region: "11",
            sort: "relevance",
            state: "1",
            language: "pt"
        )
        
        network.performRequest(
            endpoint: adsEndpoint,
            using: .convertFromSnakeCase
        ) { (result: Result<ListAdsDTO, NetworkError>) in
            switch result {
            case .success(let data):
                self.ads = data.listAds ?? []
                DispatchQueue.main.async {
                    self.adsCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

// MARK: UICollectionViewDataSource

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdListCardViewCellIdentifier", for: indexPath) as? AdListCardViewCell, !ads.isEmpty else {
            return UICollectionViewCell()
        }
        cell.configure(ad: ads[indexPath.row])
        return cell
    }
}

// MARK: Setup

extension AdsListViewController {

    private func setupUI() {
            adsCollectionView.delegate = self
            adsCollectionView.dataSource = self
            adsCollectionView.collectionViewLayout = flowLayout
            adsCollectionView.register(UINib(nibName: "AdListCardViewCell", bundle: nil), forCellWithReuseIdentifier: "AdListCardViewCellIdentifier")
    }
}
