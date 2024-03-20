//
//  PokemonListView.swift
//  PokemonHandsOn
//
//  Created by 石田　倫隆 on 2024/03/20.
//

import SwiftUI

struct PokemonListView: View {

    // API通信を行うクラスを初期化
    @StateObject var viewModel = PokemonListViewModel()

    var body: some View {
        // 実際のViewの大きさからTextやImageの大きさを変更したい時に使用する構造体
        GeometryReader { geometry in
            // 151個表示する際に、縦方向にスクロールできるようにする
            ScrollView(.vertical) {
                // 実際に画面に表示される時に描画される処理
                LazyVGrid(columns: GridItems.columns) {
                    // ForEachを使用して151個モンスターボールを表示する
                    ForEach(viewModel.pokemonListEntity) { pokemon in
                        // 非同期で画像をロードするコンポーネント
                        AsyncImage(url: URL(string: pokemon.sprites.frontImage)) { image in
                            image
                                // imageをリサイズできるようにする
                                .image?.resizable()
                                // 画像の縦横比を維持する
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geometry.size.width / 3)
                        }
                            // フレームの大きさをgeometryの大きさから算出する
                            .frame(width: geometry.size.width / 2.1, height: 200)
                            // 背景にコンテンツを設置するモディファイア
                            .background() {
                                // {}内の要素を前後に表示する
                                ZStack {
                                        // 赤色の円を表示
                                    Circle()
                                        .fill(.red)
                                        // フレームの大きさをgeometryの大きさから算出する
                                        .frame(height: geometry.size.width / 2.1)
                                        // 白色の長方形を表示
                                    Rectangle()
                                        .fill(.white)
                                        // フレームの大きさをgeometryの大きさから算出する
                                        .frame(width: geometry.size.width / 2)
                                        // 下に50ずらした部分から描画を始める処理
                                        .offset(y: geometry.size.width / 4)
                                }
                            }
                            // テキストのframeを円に描く処理
                            // 枠線を黒色に、ラインの太さを1に指定
                            .overlay {
                                Circle()
                                    .stroke(.black, lineWidth: 1)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonListView()
}
