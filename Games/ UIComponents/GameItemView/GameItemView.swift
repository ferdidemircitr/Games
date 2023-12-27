//
//  GameItemView.swift
//  Games
//
//  Created by Ferdi DEMİRCİ on 20.12.2023.
//


import Carbon
import SnapKit
import SDWebImage

class GameItemView: UIView, Component {
  
  var item: Game?
  var tapGestureHandler: ((Int) -> Void)?
//  var stateChangeHandler: Callback<GameItemView.State>?
  
  private lazy var backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = true
    return imageView
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.numberOfLines = 2
    return label
  }()
  
  private lazy var metacriticLabel: UILabel = {
    let label = UILabel()
    label.text = "metacritic:"
    label.font = UIFont(name: "Roboto-Bold", size: 14)
    return label
  }()
  
  private lazy var metacriticValueLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Roboto-Bold", size: 14)
    label.textColor = UIColor(red: 0.846, green: 0, blue: 0, alpha: 1)
    return label
  }()
  
  private lazy var genresLabel: UILabel = {
    let label = UILabel()
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
  
  func renderContent() -> GameItemView {
    return self
  }
  
  func render(in content: GameItemView) {
    guard let item = item else { return }
    
    guard let url = URL(string: item.backgroundImage) else { return }
    content.backgroundImageView.sd_setImage(with: url, completed: nil)
    content.titleLabel.text = item.name
    content.metacriticValueLabel.text = "\(item.metacritic)"
    
    guard let genres = item.genres else { return }
    let genreNames = genres.map { $0.name }
    let combinedGenreNames = genreNames.joined(separator: ", ")
    content.genresLabel.text = combinedGenreNames
  }
  
  func referenceSize(in bounds: CGRect) -> CGSize? {
    CGSize(width: bounds.width, height: 134)
  }
}

private extension GameItemView {
  func setupViews() {
    backgroundColor = .white
    addSubviews(
      backgroundImageView,
      titleLabel,
      metacriticLabel,
      metacriticValueLabel,
      genresLabel
    )
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer))
    addGestureRecognizer(tapGestureRecognizer)
    isUserInteractionEnabled = true
    
    setupConstraints()
  }
  
  @objc func handleTapGestureRecognizer() {
    if let item = item {
      tapGestureHandler?(item.id)
    } 
  }
  
  func setupConstraints() {
    backgroundImageView.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(16)
      make.centerY.equalToSuperview()
      make.width.equalTo(120)
      make.height.equalTo(104)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(backgroundImageView)
      make.leading.equalTo(backgroundImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
    metacriticLabel.snp.makeConstraints { make in
      make.bottom.equalTo(genresLabel.snp.top).offset(-8)
      make.leading.equalTo(backgroundImageView.snp.trailing).offset(16)
    }
    metacriticValueLabel.snp.makeConstraints { make in
      make.top.equalTo(metacriticLabel)
      make.leading.equalTo(metacriticLabel.snp.trailing).offset(6)
    }
    genresLabel.snp.makeConstraints { make in
      make.bottom.equalTo(backgroundImageView.snp.bottom)
      make.leading.equalTo(backgroundImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().offset(-16)
    }
  }
}
