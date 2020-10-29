//
//  UIView+Extensions.swift
//  
//
//  Created by Ivo Dutra on 22/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//
import UIKit.UIView

extension UIView {

    /// Set translatesAutoresizingMaskIntoConstraints to false
    func setConstraints(completion: (UIView) -> Void) {

        if self.translatesAutoresizingMaskIntoConstraints {
            self.translatesAutoresizingMaskIntoConstraints = false
        }

        // Completion should name its variable "view"
        completion(self)
    }

    /// Add multiple subviews at once
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }

    // MARK: - Constraints

    /// Activates topAnchor constraint to be equal to parametherView's layoutGuide
    func addTopAnchor(to relatedView: UIView, constant: CGFloat = 0) {
        topAnchor.constraint(equalTo: relatedView.layoutMarginsGuide.topAnchor, constant: constant).isActive = true
    }

    /// Activates bottomAnchor to be equal to parametherView's layoutGuide
    func addBottomAnchor(to relatedView: UIView, constant: CGFloat = 0) {
        bottomAnchor.constraint(equalTo: relatedView.layoutMarginsGuide.bottomAnchor, constant: constant).isActive = true
    }

    /// Activates leadingAnchor to be equal to parametherView's layoutGuide
    func addLeadingAnchor(to relatedView: UIView, constant: CGFloat = 0) {
        leadingAnchor.constraint(equalTo: relatedView.layoutMarginsGuide.leadingAnchor, constant: constant).isActive = true
    }

    /// Activates trainlingAnchor to be equal to parametherView's layoutGuide
    func addTrailingAnchor(to relatedView: UIView, constant: CGFloat = 0) {
        trailingAnchor.constraint(equalTo: relatedView.layoutMarginsGuide.trailingAnchor, constant: constant).isActive = true
    }

    /// Pin view to parametherView's Edges (layoutGuide)
    func pinBorders(to relatedView: UIView) {
        addTopAnchor(to: relatedView)
        addBottomAnchor(to: relatedView)
        addLeadingAnchor(to: relatedView)
        addTrailingAnchor(to: relatedView)
    }

    /// Activates centerYAnchor to be equal ot parametherView
    func addCenterYanchor(to relatedView: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: relatedView.centerYAnchor).isActive = true
    }

    /// Activates centerXAnchor to be equal ot parametherView
    func addCenterXanchor(to relatedView: UIView, constant: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: relatedView.centerXAnchor).isActive = true
    }
    
}
