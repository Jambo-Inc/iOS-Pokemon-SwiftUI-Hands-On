//
//  GridItems.swift
//  PokemonHandsOn
//
//  Created by 石田　倫隆 on 2024/03/20.
//

import SwiftUI

struct GridItems {

    // ポケモンボールを2列にするためのGridItem
    static var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10, alignment: .center), count: 2)
}
