//
//  Pokemon.swift
//  Calculator
//
//  Created by Brady Bentley on 1/9/19.
//  Copyright © 2019 Brady. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let sprites: Sprites
}

struct Sprites: Decodable {
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "front_default"
    }
}
