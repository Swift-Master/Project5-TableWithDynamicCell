//
//  Model.swift
//  Project5-TableWithDynamicCell
//
//  Created by 편성경 on 2023/06/20.
//

import Foundation

// MARK: - Model
struct Model: Codable {
    let artists: [Artist]
}

// MARK: - Artist
struct Artist: Codable {
    let name, bio, image: String
    let works: [Work]
}

// MARK: - Work
struct Work: Codable {
    let title, image, info: String
}
