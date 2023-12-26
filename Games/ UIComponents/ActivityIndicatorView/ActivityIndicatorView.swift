//
//  ActivityIndicatorView.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 22.12.2023.
//

import SnapKit
import Carbon

class ActivityIndicatorView: UIView, Component {
  
  private lazy var activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .medium)
    indicator.hidesWhenStopped = true
    return indicator
  }()
  
  private lazy var activityIndicatorLabel: UILabel = {
    let label = UILabel()
    label.text = "loading"
    label.textColor = UIColor(red: 0.541, green: 0.541, blue: 0.561, alpha: 1)
    
    return label
  }()
  
  public init() {
    super.init(frame: .zero)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func renderContent() -> ActivityIndicatorView {
    return ActivityIndicatorView()
  }
  
  func render(in content: ActivityIndicatorView) {
    content.activityIndicator.startAnimating()
  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: 60)
  }
}

extension ActivityIndicatorView {
  func setupViews() {
    backgroundColor = .white
    addSubviews(
      activityIndicator,
      activityIndicatorLabel
    )
    setupConstraints()
  }
  
  func setupConstraints() {
    activityIndicator.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(10)
      make.centerX.equalToSuperview()
    }
    
    activityIndicatorLabel.snp.makeConstraints { make in
      make.top.equalTo(activityIndicator.snp.bottom).offset(6)
      make.centerX.equalToSuperview()
    }
  }
  
  func startAnimating() {
    activityIndicator.startAnimating()
  }
  
  func stopAnimating() {
    activityIndicator.stopAnimating()
  }
}
