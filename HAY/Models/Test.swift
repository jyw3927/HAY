//
//  Test.swift
//  HAY
//
//  Created by yeo100 on 2022/07/11.
//

import Foundation
import UIKit

struct Test {
    let title: String
    var url: String
    var image: String
}

extension Test {
    static var data = [
        Test(title: "MBTI", url: "https://www.16personalities.com/ko/무료-성격-유형-검사", image: "MBTI"),
        Test(title: "에고그램 테스트", url: "http://ego.na.to/test/ego/", image: "EgoGram"),
        Test(title: "mgram", url: "https://mgram.me/ko/", image: "MGram"),
        Test(title: "애착유형 테스트", url: "http://typer.kr/test/ecr/", image: "Attach"),
        Test(title: "EQ 테스트", url: "https://eqtest.kr/", image: "EQTest"),
        Test(title: "연애 능력 테스트", url: "https://www.banggooso.com/gl/1002/", image: "Date"),
        Test(title: "연락 유형 테스트", url: "https://type-of-contact.netlify.app/", image: "Contact"),
        Test(title: "결혼상대 테스트", url: "https://www.simcong.com/quiz/349", image: "Marry"),
    ]
}
