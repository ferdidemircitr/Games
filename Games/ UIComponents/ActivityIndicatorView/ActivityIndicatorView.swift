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
    indicator.startAnimating()
    return indicator
  }()
  
  private lazy var activityIndicatorLabel: UILabel = {
    let label = UILabel()
    label.text = "loading"
    label.textColor = UIColor(red: 0.541, green: 0.541, blue: 0.561, alpha: 1)

    return label
  }()
  func renderContent() -> UIView {
    setupViews()
    return ActivityIndicatorView()
  }
  
  public init() {
    super.init(frame: .zero)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func render(in content: UIView) {
    
  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: 60)
  }
}

private extension ActivityIndicatorView {
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
}
