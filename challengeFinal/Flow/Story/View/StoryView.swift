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
        return imageView
    }()
    
    private lazy var pauseButton: PauseButton = {
        let pause = PauseButton()
        addSubview(pause)
        pause.translatesAutoresizingMaskIntoConstraints = false
        return pause
    }()

    private lazy var textView: RegularTextView = {
        let textView = RegularTextView()
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private lazy var stackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        addSubview(stack)
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        #warning("trava scroll size na content??")
       // scroll.contentSize = contentView.bounds.size
        addSubview(scroll)
        scroll.addSubview(contentView)
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(textView)
        content.addSubview(stackview)
        return content
    }()


    public init() {
        super.init(frame: .zero)
    }

    public init(with viewModel: StoryViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.89, green: 0.88, blue: 0.85, alpha: 1.00)
        setupConstraints()
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
        //FRAME
        scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0).isActive = true
        scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //CONTENT
        NSLayoutConstraint.activate([
            //4 sides, scroll relative to contentView
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: -32),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: +32),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //lock width
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

    }
    
    func setupContentViewConstrains(){
    
        textView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        

        
        stackview.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        stackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
       // stackview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(using viewModel: StoryViewModel?) {
        self.viewModel = viewModel

        prepareForReuse()
        let node = viewModel?.node
        self.imageView.recievedImage(image: loadImage(node?.imagePath))
        configureDecisions(node?.childNodes)

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

    private func configureDecisions(_ decisions: [StoryNode]?) {
        guard let decisions = decisions else { return }

        for i in 0..<decisions.count {
            let node = decisions[i]
            let button = PrimaryButton(title: String(node.title ?? ""))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = i
            button.delegate = self
            stackview.addArrangedSubview(button)
        }
    }

    private func prepareForReuse() {
        stackview.arrangedSubviews.forEach { (arrangedSubview) in
            arrangedSubview.removeFromSuperview()
        }
        self.imageView.recievedImage(image: UIImage())
        self.textView.configure(with: "")
    }
}

extension StoryView: PrimaryButtonDelegate {
    public func buttonPressed(_ buttonTag: Int) {
        guard let viewmodel = viewModel else { return }
        viewmodel.userChoosedNode(buttonTag)
    }
}
