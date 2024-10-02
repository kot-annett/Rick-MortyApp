//
//  Coordinator.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import UIKit

class Coordinator {
    static let shared = Coordinator()
    private init() {}
    
    var navigationController: UINavigationController?
    
    func showCharacterDetails(character: Character) {
        let characterViewModel = CharacterDescriptionViewModel(character: character)
        let descriptionVC = CharacterDescriptionViewController(viewModel: characterViewModel)
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
}
