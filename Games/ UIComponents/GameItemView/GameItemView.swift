//
//  GameItemView.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 20.12.2023.
//


import Carbon
import SnapKit

class GameItemView: UIView, Component {
  
  private lazy var gamesImageView: UIView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .red
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.text = "Title"
    label.numberOfLines = 2
    return label
  }()
  
  private lazy var metacritic: UILabel = {
    let label = UILabel()
    label.text = "metascritic:"
    label.font = UIFont(name: "Roboto-Bold", size: 14)
    return label
  }()
  
  private lazy var metacriticValue: UILabel = {
    let label = UILabel()
    label.text = "96"
    label.font = UIFont(name: "Roboto-Bold", size: 14)
    label.textColor = UIColor(red: 0.846, green: 0, blue: 0, alpha: 1)
    return label
  }()
  
  private lazy var genre: UILabel = {
    let label = UILabel()
    label.text = "Action, shooter"
    label.font = UIFont(name: "Roboto-Regular", size: 13)
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
  
  
  func renderContent() -> UIView {
    setupViews()
    return GameItemView()
  }
  
  func render(in content: UIView) {
    
  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: 134)
  }
  
}

private extension GameItemView {
  func setupViews() {
    backgroundColor = .white
    addSubviews(
      gamesImageView,
      titleLabel,
      metacritic,
      metacriticValue,
      genre
    )
    setupConstraints()
  }
  
  func setupConstraints() {
    gamesImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(16)
      make.centerY.equalToSuperview()
      make.width.equalTo(120)
      make.height.equalTo(104)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(gamesImageView)
      make.leading.equalTo(gamesImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
    metacritic.snp.makeConstraints { make in
      make.bottom.equalTo(genre.snp.top).offset(-8)
      make.leading.equalTo(gamesImageView.snp.trailing).offset(16)
    }
    metacriticValue.snp.makeConstraints { make in
      make.top.equalTo(metacritic)
      make.leading.equalTo(metacritic.snp.trailing).offset(6)
    }
    genre.snp.makeConstraints { make in
      make.bottom.equalTo(gamesImageView.snp.bottom)
      make.leading.equalTo(gamesImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
  }
}
