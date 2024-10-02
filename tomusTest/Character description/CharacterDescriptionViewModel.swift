//
//  CharacterDescriptionViewModel.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import Foundation

final class CharacterDescriptionViewModel {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var characterName: String {
        return "Name: \(character.name)"
    }
    
    var characterStatus: String {
        return "Status: \(character.status)"
    }
    
    var characterSpecies: String {
        return "Species: \(character.species)"
    }
    
    var characterGender: String {
        return "Gender: \(character.gender)"
    }
    
    var characterImageUrl: URL? {
        return URL(string: character.image)
    }
}
