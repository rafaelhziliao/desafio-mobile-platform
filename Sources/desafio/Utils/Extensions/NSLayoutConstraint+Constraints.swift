//
//  NSLayoutConstraint+Constraints.swift
//  desafio
//
//  Created by rafael zilao on 22/06/21.
//  Copyright © 2021 OLX. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
    static func left(firstView: UIView, secondView: UIView, constant: CGFloat = .zero) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(
            item: firstView,
            attribute: .left,
            relatedBy: .equal,
            toItem: secondView,
            attribute: .left,
            multiplier: 1,
            constant: constant
        )
    }
    
    static func right(firstView: UIView, secondView: UIView, constant: CGFloat = .zero) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(
            item: firstView,
            attribute: .right,
            relatedBy: .equal,
            toItem: secondView,
            attribute: .right,
            multiplier: 1,
            constant: constant
        )
    }
    
    static func top(firstView: UIView, secondView: UIView, constant: CGFloat = .zero) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(
            item: firstView,
            attribute: .top,
            relatedBy: .equal,
            toItem: secondView,
            attribute: .top,
            multiplier: 1,
            constant: constant
        )
    }
    
    static func bottom(firstView: UIView, secondView: UIView, constant: CGFloat = .zero) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(
            item: firstView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: secondView,
            attribute: .bottom,
            multiplier: 1,
            constant: constant
        )
    }
    
    static func safeAreaTop(
        safeAreaView: UIView,
        otherView: UIView,
        constant: CGFloat = .zero,
        statusBar: Bool = false
    ) -> NSLayoutConstraint {
        
        if #available(iOS 11.0, *) {
            return safeAreaView
                .safeAreaLayoutGuide
                .topAnchor
                .constraint(
                    equalTo: otherView.topAnchor,
                    constant: constant
            )
        } else {
            var finalConstant = constant

            if statusBar {
                finalConstant = -20 + constant
            }

            return top(
                firstView: safeAreaView,
                secondView: otherView,
                constant: finalConstant
            )
        }
    }

}
