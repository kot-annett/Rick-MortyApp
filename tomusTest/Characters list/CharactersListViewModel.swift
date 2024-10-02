//
//  CharactersListViewModel.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import Foundation

final class CharactersListViewModel {
    private var characters: [Character] = []
    private var currentPage = 1
    private var isLoading = false
    private var hasMorePages = true
    
    var didUpdateCharacters: (() -> Void)?
    
    func loadCharacters() {
        guard !isLoading else { return }
        isLoading = true
        
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(currentPage)"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(CharacterResponse.self, from: data)
                self.characters.append(contentsOf: result.results)
                self.hasMorePages = result.info.next != nil
                self.currentPage += 1
                
                DispatchQueue.main.async {
                    self.didUpdateCharacters?() // Сообщаем контроллеру об обновлении данных
                    self.isLoading = false
                }
            } catch {
                print("Failed to decode: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func getCharacter(at index: Int) -> Character {
        return characters[index]
    }
    
    func numberOfCharacters() -> Int {
        return characters.count
    }
    
    func shouldLoadMoreCharacters(at indexPath: IndexPath) -> Bool {
        return indexPath.row == characters.count - 1 && hasMorePages && !isLoading
    }
    
}
