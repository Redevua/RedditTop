//
//  UIView+Extension.swift
//  Reddit Top
//
//  Created by Danylo Bulanov on 3/24/20.
//  Copyright © 2020 Redevua. All rights reserved.
//

import UIKit

public enum SuperSides {
    case vertical
    case horizontal
}

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func addAutolayoutSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }
    
    func addAutolayoutSubviews(_ subviews: UIView...) {
        subviews.forEach(addAutolayoutSubview)
    }
    
    @discardableResult
    func toSuperEdges(insets: UIEdgeInsets = .zero, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: Float = 1000, isSafe: Bool = false) -> UIView {
        toSuper(.top, relation: relation, multiplier: multiplier, constant: insets.top, priority: priority, isSafe: isSafe)
        toSuper(.leading, relation: relation, multiplier: multiplier, constant: insets.left, priority: priority, isSafe: isSafe)
        toSuper(.bottom, relation: relation, multiplier: multiplier, constant: -insets.bottom, priority: priority, isSafe: isSafe)
        toSuper(.trailing, relation: relation, multiplier: multiplier, constant: -insets.right, priority: priority, isSafe: isSafe)
        return self
    }
    
    @discardableResult
    func toSuperCenter(offset: CGSize = .zero, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: Float = 1000, isSafe: Bool = false) -> UIView {
        anchor(.centerX, to: superview!, relation: relation, multiplier: multiplier, constant: offset.height, priority: priority, isSafe: isSafe)
        anchor(.centerY, to: superview!, relation: relation, multiplier: multiplier, constant: offset.width, priority: priority, isSafe: isSafe)
        return self
    }
    
    @discardableResult
    func toSuper(anchors: NSLayoutConstraint.Attribute...) -> UIView {
        anchors.forEach({ self.toSuper($0) })
        return self
    }
    
    @discardableResult
    func toSuperSides(_ sides: SuperSides, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, isSafe: Bool = false) -> UIView {
        switch sides {
        case .horizontal:
            anchor(.leading, to: superview!, relation: relation, multiplier: multiplier, constant: constant, priority: priority, isSafe: isSafe)
            anchor(.trailing, to: superview!, relation: relation, multiplier: multiplier, constant: -constant, priority: priority, isSafe: isSafe)
        case .vertical:
            anchor(.top, to: superview!, relation: relation, multiplier: multiplier, constant: constant, priority: priority, isSafe: isSafe)
            anchor(.bottom, to: superview!, relation: relation, multiplier: multiplier, constant: -constant, priority: priority, isSafe: isSafe)
        }
        return self
    }
    
    @discardableResult
    func toSuper(_ superAnchor: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, isSafe: Bool = false) -> UIView {
        anchor(superAnchor, to: superview!, relation: relation, multiplier: multiplier, constant: constant, priority: priority, isSafe: isSafe)
        return self
    }
    
    @discardableResult
    func toSuper(_ superAnchor: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, isSafe: Bool = false, configure: (NSLayoutConstraint) -> Void) -> UIView {
        anchor(superAnchor, to: superview!, anchor: superAnchor, relation: relation, multiplier: multiplier, constant: constant, priority: priority, isSafe: isSafe, configure: configure)
        return self
    }
    
    @discardableResult
    func anchor(_ selfAnchor: NSLayoutConstraint.Attribute, to view: UIView, anchor: NSLayoutConstraint.Attribute? = nil, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, isSafe: Bool = false) -> UIView {
        return self.anchor(selfAnchor, to: view, anchor: anchor, relation: relation, multiplier: multiplier, constant: constant, priority: priority, isSafe: isSafe, configure: { _ in })
    }
    
    @discardableResult
    func anchor(_ selfAnchor: NSLayoutConstraint.Attribute, to view: UIView, anchor: NSLayoutConstraint.Attribute?, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, isSafe: Bool = false, configure: (NSLayoutConstraint) -> Void) -> UIView {
        let anchor = anchor ?? selfAnchor
        let toItem = isSafe ? view.safeAreaLayoutGuide : view
        let constraint = NSLayoutConstraint(item: self, attribute: selfAnchor, relatedBy: relation, toItem: toItem, attribute: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = true
        configure(constraint)
        return self
    }
    
    @discardableResult
    func size(_ size: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: Float = 1000) -> UIView {
        self.size(width: size, height: size, relation: relation, priority: priority)
    }
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: Float = 1000) -> UIView {
        size(width: width, relation: relation, priority: priority)
        size(height: height, relation: relation, priority: priority)
        return self
    }
    
    @discardableResult
    func size(height: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: Float = 1000) -> UIView {
        size(height: height, relation: relation, priority: priority, configure: { _ in })
    }
    
    @discardableResult
    func size(height: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: Float = 1000, configure: (NSLayoutConstraint) -> Void) -> UIView {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
        constraint.priority = UILayoutPriority(rawValue: priority)
        constraint.isActive = true
        configure(constraint)
        return self
    }
    
    @discardableResult
    func size(width: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: Float = 1000) -> UIView {
        size(width: width, relation: relation, priority: priority, configure: { _ in })
    }
    
    @discardableResult
    func size(width: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: Float = 1000, configure: (NSLayoutConstraint) -> Void) -> UIView {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
        constraint.priority = UILayoutPriority(rawValue: priority)
        constraint.isActive = true
        configure(constraint)
        return self
    }
    
    @discardableResult
    func aspectWidth(multipliedHeight: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, configure: ((NSLayoutConstraint) -> Void)? = nil) -> UIView {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: multipliedHeight, constant: constant)
        constraint.priority = UILayoutPriority(rawValue: priority)
        constraint.isActive = true
        configure?(constraint)
        return self
    }
    
    @discardableResult
    func aspectHeight(multipliedWidth: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000) -> UIView {
        aspectHeight(multipliedWidth: multipliedWidth, constant: constant, priority: priority, configure: { _ in })
    }
    
    @discardableResult
    func aspectHeight(multipliedWidth: CGFloat = 1, constant: CGFloat = 0, priority: Float = 1000, configure: (NSLayoutConstraint) -> Void) -> UIView {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: multipliedWidth, constant: constant)
        constraint.priority = UILayoutPriority(rawValue: priority)
        constraint.isActive = true
        configure(constraint)
        return self
    }
}
