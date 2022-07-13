//
//  Conversation.swift
//  HAY
//
//  Created by yeo100 on 2022/07/13.
//

import Foundation
import UIKit

struct Conversation {
    let title: String
}

extension Conversation {
    static var data = [
        Conversation(title: "가족"),
        Conversation(title: "나"),
        Conversation(title: "너"),
        Conversation(title: "상상"),
        Conversation(title: "일상"),
        Conversation(title: "과거"),
        Conversation(title: "미래"),
        Conversation(title: "관계")
    ]
}
