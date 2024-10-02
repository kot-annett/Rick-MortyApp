//
//  CharactersListViewController.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import UIKit

final class CharactersListViewController: UIViewController {
//    private let characters = [Character]()
    private let characters = MockCharacters
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.layer.cornerRadius = 16
        table.layer.masksToBounds = true
        table.isScrollEnabled = true
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
        setupNavigationBar()
    }
    
    private func setupTableView() {
        tableView.register(CharacterCellViewController.self, forCellReuseIdentifier: CharacterCellViewController.reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Все персонажи"
        navigationController?.navigationBar.tintColor = .white
    }
}

extension CharactersListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterCellViewController.reuseIdentifier,
            for: indexPath
        ) as? CharacterCellViewController else {
            return UITableViewCell()
        }
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        didSelectCharacter(selectedCharacter)
    }
}

extension CharactersListViewController: CharacterSelectionDelegate {
    func didSelectCharacter(_ character: Character) {
        let descriptionVC = CharacterDescriptionViewController()
        descriptionVC.configure(with: character)
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
}
