//
//  DetailsView.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 27.12.2023.
//

import Foundation
import UIKit
import Carbon

class DetailsView: UIView, Component {
  
  var item: GameDetails?
  
  private lazy var backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
  }()
  
  private lazy var gradientContainerView: UIView = {
    let view = UIView()
    return view
  }()
  
  private lazy var gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [
      UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
      UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
    ]
    gradientLayer.locations = [0.0, 1.0]
    return gradientLayer
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "Roboto-Bold", size: 36)
    label.textAlignment = .center
    return label
  }()
  
  private lazy var descriptionTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Game Description"
    label.font = UIFont(name: "Roboto-Regular", size: 17)
    return label
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Roboto-Regular", size: 12)
    label.numberOfLines = 4
    return label
  }()
  
  public init() {
    super.init(frame: .zero)
    setupViews()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = gradientContainerView.bounds
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func renderContent() -> DetailsView {
    return self
  }
  
  func render(in content: DetailsView) {
    guard let item = item else { return }
    
    guard let url = URL(string: item.backgroundImage) else { return }
    content.backgroundImageView.sd_setImage(with: url, completed: nil)
    content.titleLabel.text = item.name
    content.descriptionLabel.text = item.descriptionRaw
  }
  
//  func referenceSize(in bounds: CGRect) -> CGSize? {
//    CGSize(width: bounds.width, height: 333)
//  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
      return intrinsicContentSize()
  }

  func intrinsicContentSize() -> CGSize {
      layoutIfNeeded()
      let height = descriptionLabel.frame.maxY + 16 // 16: padding
      return CGSize(width: bounds.width, height: height)
  }
}

private extension DetailsView {
  func setupViews() {
    addSubviews(
      backgroundImageView,
      gradientContainerView,
      titleLabel,
      descriptionTitleLabel,
      descriptionLabel
    )
    
    gradientContainerView.layer.addSublayer(gradientLayer)
    setupConstraints()
  }
  
  func setupConstraints() {
    backgroundImageView.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(291)
    }
    
    gradientContainerView.snp.makeConstraints { make in
      make.bottom.equalTo(backgroundImageView.snp.bottom)
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalTo(100)
    }
    
    titleLabel.snp.makeConstraints { make in
      make.bottom.equalTo(backgroundImageView.snp.bottom).offset(-16)
      make.leading.equalToSuperview().offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
    
    descriptionTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(gradientContainerView.snp.bottom).offset(16)
      make.leading.equalToSuperview().offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(8)
      make.leading.equalToSuperview().offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
  }
}
