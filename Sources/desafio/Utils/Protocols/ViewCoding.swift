//
//  ViewCoding.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import Foundation

public protocol ViewCoding {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func buildView()
}

extension ViewCoding {
    func buildView() {
        buildViewHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() {}
}
