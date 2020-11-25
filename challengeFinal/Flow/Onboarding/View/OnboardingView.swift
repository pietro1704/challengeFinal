//
//  OnboardingView.swift
//  challengeFinal
//
//  Created by Guilherme Tavares Shimamoto on 24/11/20.
//

import UIKit

public class OnboardingView: UIView {
    var viewModel: OnboardingViewModel?
    
    private lazy var imageView: ImageView = {
        let imageView = ImageView()
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    public lazy var hudView: HUDView = {
        let hud = HUDView()
        addSubview(hud)
        
        hud.translatesAutoresizingMaskIntoConstraints = false
        return hud
    }()

    private lazy var textView: RegularTextView = {
        let textView = RegularTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .background
        return textView
    }()

    private lazy var continueButton: TransparentButton = {
        let gotodec = TransparentButton(title: "Ignorar guia louco")
        gotodec.translatesAutoresizingMaskIntoConstraints = false
        gotodec.delegate = self
        return gotodec
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scroll)
        scroll.addSubview(contentView)
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(textView)
        content.addSubview(continueButton)
        return content
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.background
    }
    
    public init(with viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = UIColor.background
        setupConstraints()
    }
    
    public func configure(using viewModel: OnboardingViewModel?) {
        self.viewModel = viewModel
        
        if let text = viewModel?.text,
           let imagePath = viewModel?.imagePath,
           let image = UIImage(named: imagePath) {
            textView.configure(with:  text)
            imageView.recievedImage(image: image)
        }
        
        //Points to be displayed in Onboarding HUD
        hudView.decisionPointsView.updateLabel(withPoints: 11)

        scrollView.scrollRectToVisible(CGRect.init(x: 0, y: 0, width: 1, height: 1), animated: false)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 360/812).isActive = true
        
        setupHUDViewConstrains()
        setupScrollViewConstrains()
        setupContentViewConstrains()
    }
    
    func setupHUDViewConstrains() {
        hudView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        hudView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -16).isActive = true
        hudView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        hudView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    fileprivate func setupScrollViewConstrains() {
        // SCROLL FRAME
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // SCROLL CONTENT
        NSLayoutConstraint.activate([
            // 4 sides, scroll relative to contentView
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -32),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 32),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    func setupContentViewConstrains() {
        textView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        continueButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 32).isActive = true
        continueButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        
        continueButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
}

extension OnboardingView: TransparentButtonDelegate {
    public func transpButtonPressed() {
        viewModel?.didTapShowChapter()
    }
}
