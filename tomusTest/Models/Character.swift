//
//  Character.swift
//  tomusTest
//
//  Created by Anna on 02.10.2024.
//

import Foundation

struct Character {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let created: String
}

struct Origin {
    let name: String
    let url: String
}

struct Location {
    let name: String
    let url: String
}
