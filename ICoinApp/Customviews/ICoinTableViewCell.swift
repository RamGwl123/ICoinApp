//
//  ICoinTableViewCell.swift
//  ICoinApp
//
//  Created by Ram Naidu on 17/11/24.
//

import UIKit

final class ICoinTableViewCell: UITableViewCell {
    
    static let identifier = "ICoinTableViewCell"
    
    // MARK: - Variable
    private(set) var coin: Coin!
    
    // MARK: - UI Componts
    private var coinLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark") // square.and.arrow.up.fill
        iv.tintColor = .black
        return iv
    }()
    
    private let coinName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    // TODO: - PrepareReuse
    
    // MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with coin: Coin) {
        self.coinName.text = coin.name
//        let imageData = try? Data(contentsOf: self.coin.logoURL!)
//        if let imageData = imageData {
//            DispatchQueue.main.async {
//                self.coinLogo.image =  UIImage(data: imageData)
//            }
//        }
    }
    // MARK: - setupUI
    func setupUI() {
        self.addSubview(coinLogo)
        self.addSubview(coinName)
        
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        coinName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinLogo.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            coinLogo.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            coinLogo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            coinName.leadingAnchor.constraint(equalTo: coinLogo.trailingAnchor, constant: 16),
            coinName.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
