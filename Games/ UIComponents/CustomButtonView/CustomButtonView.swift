//
//  CustomButton.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 27.12.2023.
//

import Carbon
import Foundation
import UIKit
import SnapKit

class CustomButtonView: UIView, Component {
  var url: String?
  
  private lazy var urlButton: UIButton = {
    let button = UIButton()
    button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17)
    button.setTitleColor(UIColor.black, for: .normal)
    button.contentHorizontalAlignment = .left
    button.addTarget(self, action: #selector(didTapOpenSafari), for: .touchUpInside)
    return button
  }()
  
  @objc func didTapOpenSafari() {
      if let url = url,
         let url = URL(string: url) {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
      }
  }
  
  public init(title: String, url: String) {
    super.init(frame: .zero)
    configure(title, url)
    setupViews()
  }
  
  func configure(_ title: String, _ url: String) {
    urlButton.setTitle(title, for: .normal)
    self.url = url
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func renderContent() -> CustomButtonView {
    return self
  }
  
  func render(in content: CustomButtonView) {
  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: 54)
  }
}

private extension CustomButtonView {
  func setupViews() {
    addSubview(urlButton)
    setupConstraints()
  }
  
  func setupConstraints() {
    urlButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(16)
      make.bottom.trailing.equalToSuperview().offset(-16)
    }
  }
}

