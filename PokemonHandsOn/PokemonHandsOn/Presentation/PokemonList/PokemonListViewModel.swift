//
//  PokemonListViewModel.swift
//  PokemonHandsOn
//
//  Created by 石田　倫隆 on 2024/03/20.
//

import Foundation

// ポケモンのdataを取得する際に使用するViewModel
// 主にロジックを格納するクラス

// UIの更新を行うため@MainActorを付与する
@MainActor
final class PokemonListViewModel: ObservableObject {

    // 取得したポケモンのデータのリストを格納するプロパティ
    @Published var pokemonListData: [PokemonEntity] = []

    // 取得したいポケモンのurlを配列で格納するプロパティ
    // 初期化時に、1~151までを代入したurlを格納する配列
    private var pokemonUrlList: [URL] = (1...151).map { URL(string: "https://pokeapi.co/api/v2/pokemon/\($0)/")! }

    // ViewModel初期化時に下記のメソッドを行う
    init() {
        fetchPokemonDataList()
    }
}

private extension PokemonListViewModel {

    // 151匹ポケモンのdataを取得する非同期処理
    func fetchPokemonDataList() {
        Task {
            do {
                var responsePokemonEntity: [PokemonEntity] = []
                // 非同期に複数のHTTPリクエストを並列に実行
                try await withThrowingTaskGroup(of: (Data, URLResponse).self) { group in
                    for pokemonUrl in pokemonUrlList {
                        group.addTask {
                            let (data, response) = try await URLSession.shared.data(from: pokemonUrl)
                            return (data, response)
                        }
                    }

                    // ポケモンDataを取得し終える度に、decode処理が走ります
                    for try await (data, _) in group {
                        let decoder = JSONDecoder()
                        // リクエストで返ってきたポケモンのdataをPokemonEntity型として扱うことができるようにします
                        let pokemon = try decoder.decode(PokemonEntity.self, from: data)
                        responsePokemonEntity.append(pokemon)
                    }
                    responsePokemonEntity.sort { $0.id < $1.id }
                    self.pokemonListData = responsePokemonEntity
                    print(responsePokemonEntity)
                }
            } catch {
                // 失敗した場合はエラーを投げる
                throw PokemonFetchError.unknown
            }
        }

    }
}
