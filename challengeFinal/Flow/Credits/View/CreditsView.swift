//
//  StoryView.swift
//  challengeFinal
//
//  Created by Guilherme Domingues on 14/10/20.
//

import UIKit

public protocol CreditsViewDelegate: class {
    func goToMenu()
    func startNewGame()
}

public class CreditsView: UIView {
    
    weak var delegate: CreditsViewDelegate?
    public var viewModel: CreditsViewModel?
    
    private lazy var imageView: ImageView = {
        let imageView = ImageView()
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var textView: RegularTextView = {
        let textView = RegularTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .background
        addSubview(textView)
        return textView
    }()
    
    private lazy var newStoryButton: TransparentButton = {
        let story = TransparentButton(title: "Iniciar nova história")
        story.translatesAutoresizingMaskIntoConstraints = false
        addSubview(story)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(startNewGame))
        story.addGestureRecognizer(gesture)
        
        return story
    }()
    
    private lazy var toMenuButton: TransparentButton = {
        let menu = TransparentButton(title: "Voltar ao menu")
        menu.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menu)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToMenu))
        menu.addGestureRecognizer(gesture)

        return menu
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newStoryButton, toMenuButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        stack.axis = .horizontal
        addSubview(stack)
        return stack
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
        content.addSubview(buttonsStackView)
        return content
    }()
    
    public func update(title: String, imagePath: String, accentColor: String = "Red") {
        self.textView.configure(with: title)
        if let image = UIImage(named: imagePath) {
            self.imageView.recievedImage(image: image)
        }
    }
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.background
        setupConstraints()
        startAutomaticScroll()
    }
    
    public init(with viewModel: CreditsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = UIColor.background
        setupConstraints()
        startAutomaticScroll()
    }
    
    fileprivate func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        
        setupScrollViewConstrains()
        
        setupContentViewConstrains()
    }
    
    fileprivate func setupScrollViewConstrains() {
        // SCROLL FRAME
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: topAnchor).isActive = true
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

        buttonsStackView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        buttonsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(using viewModel: CreditsViewModel?) {
        guard let viewModel = viewModel else { return }
        self.viewModel = viewModel
        
        prepareForReuse()
        self.imageView.recievedImage(image: loadImage(viewModel.imagePath))
        
        self.textView.configure(with: viewModel.text)
        
        setupConstraints()
    }
    
    public func loadImage(_ imagePath: String?) -> UIImage {
        guard let imagePath = imagePath,
              let image = UIImage(named: imagePath) else { return UIImage() }
        return image
    }
    
    func startAutomaticScroll(){
        let rect = CGRect(x: 0, y: scrollView.contentSize.height - 200, width: scrollView.bounds.width, height: 200)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
    private func prepareForReuse() {
        self.imageView.recievedImage(image: UIImage())
        self.textView.configure(with: "")
    }
    
    @objc func startNewGame() {
        viewModel?.userWantToStartNewGame()
    }

    @objc func goToMenu() {
        viewModel?.userWantToGoToMenu()
    }
}
