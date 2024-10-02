//
//  CharacterDetailViewController.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import Kingfisher
import UIKit

final class CharacterCellViewController: UITableViewCell {
    
    static let reuseIdentifier = "CharacterTableViewCell"
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI() 
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        
        [characterImageView, genderLabel, statusLabel, speciesLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 100),
            characterImageView.heightAnchor.constraint(equalToConstant: 100),
            
            genderLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            genderLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            statusLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            speciesLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
        ])
    }
    
    func configure(with character: Character) {
        genderLabel.text = "Gender: \(character.gender)"
        statusLabel.text = "Status: \(character.status)"
        speciesLabel.text = "Species: \(character.species)"
        
        if let imageUrl = URL(string: character.image) {
            characterImageView.kf.setImage(with: imageUrl)
        }
    }
}

