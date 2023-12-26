//
//  SpacingComponent.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 21.12.2023.
//

import UIKit
import Carbon

public struct SpacingComponent: IdentifiableComponent {
  
  private let height: CGFloat
  private let color: UIColor
  private let forceHeight: Bool

  public init(
    _ height: CGFloat,
    color: UIColor = .clear,
    forceHeight: Bool = false
  ) {
    self.height = height
    self.color = color
    self.forceHeight = forceHeight
  }

  public func shouldContentUpdate(with next: SpacingComponent) -> Bool {
    true
  }

  public func renderContent() -> UIView {
    let view = UIView()
    view.backgroundColor = color
    if forceHeight {
      view.snp.makeConstraints {
        $0.height.equalTo(height)
      }
    }
    return view
  }

  public func render(in content: UIView) {
    content.backgroundColor = color
  }

  public func shouldRender(next: SpacingComponent, in content: UIView) -> Bool {
    return true
  }

  public func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: height)
  }
}
