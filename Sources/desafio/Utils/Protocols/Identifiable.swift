//
//  Identifiable.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import UIKit

public protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable where Self: UIView {
    public static var identifier: String {
        return "\(Self.self)"
    }
}
