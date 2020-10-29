//
//  PointsView.swift
//  challengeFinal
//
//  Created by Ivo Dutra on 27/10/20.
//

import UIKit

/// Creates a view containing the indicator (image) for the points and its label
/// Size height and width needs to be set from outside
class PointsView: UIView {

    // MARK: - Properties

    private lazy var pointsLabel: UILabel = UILabel()
    public lazy var iconImage: UIImageView = UIImageView()
    /// Simply a point so that pointsLabel trailing and iconImage leading can attach to
    private lazy var centerPointView: UIView = UIView()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Animations
}

    // MARK: - View Codable

extension PointsView: ViewCodable {

    func setupHierarchy() {
        centerPointView.addSubviews(pointsLabel, iconImage)
        self.addSubviews(centerPointView)
    }

    func render() {
        iconImage.image = UIImage(named: "arrows")
        iconImage.tintColor = .purple
        iconImage.contentMode = .scaleAspectFit

        // Default points
        pointsLabel.text = "0"
        pointsLabel.font = UIFont.systemFont(ofSize: 34, weight: UIFont.Weight.thin)
        pointsLabel.textColor = .red
    }

    func setConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        setCenterPointViewConstraints()
        setIconImageConstraints()
        setPointsLabelConstraints()
    }

    // MARK: - View Codable Helpers

    func setCenterPointViewConstraints() {
        // Point to leading and trailing anchors can attatch to
        centerPointView.setConstraints { (view) in
            view.widthAnchor.constraint(equalToConstant: 1).isActive = true
            view.heightAnchor.constraint(equalToConstant: 1).isActive = true

            // Lock itself in the center
            view.addCenterXanchor(to: self)
            view.addCenterYanchor(to: self)
        }
    }

    func setIconImageConstraints() {
        iconImage.sizeToFit()
        iconImage.setContentCompressionResistancePriority(.required, for: .vertical)
        iconImage.setConstraints { (view) in
            view.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)

            // Equal center to main View
            view.addCenterYanchor(to: self)
            view.trailingAnchor.constraint(equalTo: centerPointView.trailingAnchor, constant: -2).isActive = true
        }
    }

    func setPointsLabelConstraints() {
        pointsLabel.sizeToFit()
        pointsLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        pointsLabel.setConstraints { (view) in
            view.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)

            // Equal center to main View
            view.addCenterYanchor(to: self)
            view.leadingAnchor.constraint(equalTo: centerPointView.leadingAnchor, constant: 2).isActive = true
        }
    }

}

