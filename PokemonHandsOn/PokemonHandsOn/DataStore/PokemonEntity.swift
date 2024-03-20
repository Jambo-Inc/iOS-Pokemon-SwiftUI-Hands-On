//
//  PokemonEntity.swift
//  PokemonHandsOn
//
//  Created by 石田　倫隆 on 2024/03/20.
//

import Foundation

/// ポケモンを取得して格納する際に使用するデータ型
/// name:ポケモンの名前, id:図鑑番号,sprites:ポケモンの画像のネスト型.types:ポケモンの所属するタイプ
@MainActor
struct PokemonEntity: Decodable, Identifiable {

    let name: String
    let id: Int
    let sprites: Images
    let types: [Types]

    // spritesのみ入れ子になっているため、DecodeするKeyを直接代入
    struct Images: Codable {
        let frontImage: String
        let shinyImage: String

        enum CodingKeys: String, CodingKey {
            case frontImage = "front_default"
            case shinyImage = "front_shiny"
        }
    }

    struct Types: Codable {
        let type: `Type`
    }

    struct `Type`: Codable {
        let name: String
    }
}
