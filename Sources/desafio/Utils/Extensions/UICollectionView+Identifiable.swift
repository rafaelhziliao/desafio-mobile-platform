//
//  UICollectionView+Identifiable.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
        else {
            return T()
        }
        return cell
    }

    func registerNib<T: UICollectionViewCell>(_: T.Type) where T: Identifiable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func register<T: UICollectionViewCell>(_: T.Type) where T: Identifiable {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
}
