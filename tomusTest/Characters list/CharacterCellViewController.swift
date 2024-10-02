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
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
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
        
        [characterImageView, nameLabel, genderLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 100),
            characterImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20)
        ])
    }
    
    func configure(with character: Character) {
        nameLabel.text = "Gender: \(character.name)"
        genderLabel.text = "Status: \(character.gender)"
        
        if let imageUrl = URL(string: character.image) {
            characterImageView.kf.setImage(with: imageUrl)
        }
    }
}

