//
//  ICoinViewController.swift
//  ICoinApp
//
//  Created by Ram Naidu on 17/11/24.
//

import UIKit

final class ICoinViewController: UIViewController {
    
    // MARK: - variable
    private let coins: [Coin] = Coin.getMorkArray()
    
    // MARK: - UI Componts
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(ICoinTableViewCell.self, forCellReuseIdentifier: ICoinTableViewCell.identifier)
        return tv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
    }
    
    // MARK: - setupUI
    
    func setupUI() {
        self.navigationItem.title = "iCryyptPro"
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    // MARK: - Selectors
    
    
}

// MARK: - UItableView function

extension ICoinViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ICoinTableViewCell.identifier, for: indexPath) as? ICoinTableViewCell else {
            fatalError("Unable to deque  ICoinTableViewCell in viewcontroller")
        }
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let coin = self.coins[indexPath.row]
        let vc = CroyptoViewController(coin: coin)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
