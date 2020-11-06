//
//  StoryView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public protocol StoryViewDelegate: class {
    func userChoose(nodeId: NodeID)
}

public class StoryView: UIView {

    public var viewModel: StoryViewModel?
    weak var delegate: StoryViewDelegate?

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

    private lazy var goToDecisionButton: TransparentButton = {
        let gotodec = TransparentButton(title: "Tente por você mesmo")
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
        content.addSubview(goToDecisionButton)
        return content
    }()

    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.background
    }

    public init(with viewModel: StoryViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = UIColor.background
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        
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
        
        goToDecisionButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        goToDecisionButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        
        goToDecisionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        goToDecisionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(using viewModel: StoryViewModel?) {
        self.viewModel = viewModel
        
        prepareForReuse()
        let node = viewModel?.node
        self.imageView.recievedImage(image: loadImage(node?.imagePath))

        if let textInfos = node?.text {
            self.textView.configure(with: textInfos)
        }
        setupConstraints()
    }

    public func loadImage(_ imagePath: String?) -> UIImage {
        guard let imagePath = imagePath,
              let image = UIImage(named: imagePath) else { return UIImage() }
        return image
    }

    private func prepareForReuse() {
        self.imageView.recievedImage(image: UIImage())
        self.textView.configure(with: "")
    }
}

extension StoryView: TransparentButtonDelegate {
    public func transpButtonPressed() {
        viewModel?.userWantToChoose()
    }
}

// MARK: - Bridge view - viewModel

extension StoryView: HUDViewDelegate {

    public func updateHUD(with points: Int) {
        hudView.decisionPointsView.updateLabel(withPoints: points)
    }

}
