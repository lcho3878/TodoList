//
//  Score.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/11.
//

import Foundation
import UIKit
class Score {
    var score = 0
    init(score: Int = 0) {
        var sum = 0
        for i in 0..<done.count {
            if done[i].inDuedate == true {
                sum += 1
            }
        }
        self.score = sum
    }
    func showScore () -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "점수는 \(self.score)점 입니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        return alert
    }
}

