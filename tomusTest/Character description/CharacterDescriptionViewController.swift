//
//  CharacterDescriptionViewController.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import UIKit

final class CharacterDescriptionViewController: UIViewController {
    private var viewModel: CharacterDescriptionViewModel?
    
    init(viewModel: CharacterDescriptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        configureUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        [characterImageView, nameLabel, statusLabel, speciesLabel, genderLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            characterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 200),
            characterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            speciesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 10),
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Описание персонажа"
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    private func configureUI() {
        nameLabel.text = viewModel?.characterName
        statusLabel.text = viewModel?.characterStatus
        speciesLabel.text = viewModel?.characterSpecies
        genderLabel.text = viewModel?.characterGender
        
        if let url = viewModel?.characterImageUrl {
            characterImageView.kf.setImage(with: url)
        }
    }
}

