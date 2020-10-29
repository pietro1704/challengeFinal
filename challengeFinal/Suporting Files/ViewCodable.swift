//
//  ViewCodable.swift
//  
//
//  Created by Ivo Dutra on 22/08/20.
//  Copyright © 2020 Ivo Dutra. All rights reserved.
//
import UIKit

protocol ViewCodable {
    /// Use to setup delegates
    func configure()
    /// Use to add any UI components inside the view
    func setupHierarchy()
    /// Customize the UIComponents(images, texts, fonts, colors)
    func render()
    /// Setup constraints to the view and the subviews
    func setConstraints()
    /// Setup any acessibility to the view
    func setupAcessibilityIdentifiers()
    /// This method builds the view using all the other methods fom the protocol
    func setupView()
}

extension ViewCodable {

    func configure() {}
    func setupAcessibilityIdentifiers() {}

    func setupView() {
        configure()
        setupHierarchy()
        render()
        setConstraints()
        setupAcessibilityIdentifiers()
    }
 
}
