//
//  PokemonListView.swift
//  PokemonHandsOn
//
//  Created by 石田　倫隆 on 2024/03/20.
//

import SwiftUI

struct PokemonListView: View {

    var body: some View {
        // 151個表示する際に、縦方向にスクロールできるようにする
        ScrollView(.vertical) {
            VStack {
                // ForEachを使用して151個モンスターボールを表示する
                ForEach(0..<151) { number in
                    Text("手順2 No.\(number)")
                        .frame(width: 100, height: 100)
                        // 背景にコンテンツを設置するモディファイア
                        .background() {
                            // {}内の要素を前後に表示する
                            ZStack {
                                    // 赤色の円を表示
                                Circle()
                                    .fill(.red)
                                    .frame(height: 100)
                                    // 白色の長方形を表示
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 100)
                                    // 下に50ずらした部分から描画を始める処理
                                    .offset(y: 50)
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

#Preview {
    PokemonListView()
}
