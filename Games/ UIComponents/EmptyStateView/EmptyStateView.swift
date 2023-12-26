//
//  EmptyStateView.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 26.12.2023.
//

import Foundation
import Carbon
import UIKit
import SnapKit

class EmptyStateView: UIView, Component {
  
  var message: String?
  
  private lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Roboto-Medium", size: 18)
    return label
  }()
  
  public init() {
    super.init(frame: .zero)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func renderContent() -> Content {
    return self
  }
  
  func render(in content: EmptyStateView) {
    if let message = message {
      content.messageLabel.text = message
    }
  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: 41)
  }
}

private extension EmptyStateView {
  func setupViews() {
    addSubviews(messageLabel)
    setupConstraints()
  }
  
  func setupConstraints() {
    messageLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(40)
      make.centerX.equalToSuperview()
    }
  }
}
