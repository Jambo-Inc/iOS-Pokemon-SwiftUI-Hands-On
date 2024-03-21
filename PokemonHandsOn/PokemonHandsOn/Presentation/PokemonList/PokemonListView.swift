//
//  PokemonListView.swift
//  PokemonHandsOn
//
//  Created by 石田　倫隆 on 2024/03/20.
//

import SwiftUI

struct PokemonListView: View {

    // ポケモンボールを2列にするためのGridItem
    static var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10, alignment: .center), count: 2)

    var body: some View {

        Text("手順1、モンスターボールを表示する")
    }
}

#Preview {
    PokemonListView()
}
