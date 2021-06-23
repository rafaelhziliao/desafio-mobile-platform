//
//  UIView+Constraints.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import UIKit

public extension UIView {

    func safeAreaTop(safeAreaView: UIView, constant: CGFloat = .zero, statusBar: Bool = false) {
        let constraint: NSLayoutConstraint = .safeAreaTop(
            safeAreaView: safeAreaView,
            otherView: self,
            constant: constant,
            statusBar: statusBar
        )
        constraint.isActive = true
    }

    func bottomConstraint(parentView: UIView, constant: CGFloat = .zero) {
        let constraint: NSLayoutConstraint = .bottom(
            firstView: self,
            secondView: parentView,
            constant: -constant
        )
        constraint.isActive = true
    }

    func rightConstraint(parentView: UIView, constant: CGFloat = .zero) {
        let constraint: NSLayoutConstraint = .right(
            firstView: self,
            secondView: parentView,
            constant: -constant
        )
        constraint.isActive = true
    }

    func leftConstraint(parentView: UIView, constant: CGFloat = .zero) {
        let constraint: NSLayoutConstraint = .left(
            firstView: self,
            secondView: parentView,
            constant: constant
        )
        constraint.isActive = true
    }
}
