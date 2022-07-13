//
//  Game.swift
//  HAY
//
//  Created by yeo100 on 2022/07/13.
//

import Foundation
import UIKit

struct Game {
    let title: String
    let image: String
}

extension Game {
    static var data = [
        Game(title: "밸런스 게임", image: "game1"),
        Game(title: "이구동성", image: "game2"),
        Game(title: "O/X 퀴즈", image: "game3"),
        Game(title: "상식퀴즈", image: "game4"),
        Game(title: "초성게임", image: "game5")
    ]
}
