//
//  Instances.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/11.
//

import Foundation
import UIKit

var todo_delete : [Todo] = []
var todo : [[Todo]] = [[Todo(category: "공부", content: "스위프트 공부",dueDate: "", isComplete: true)], [Todo(category: "프로젝트", content: "프로젝트",dueDate: "", isComplete: false)], [], [Todo(category: "공부", content: "기타",dueDate: "", isComplete: false)]] // 공부, 프로젝트, 일상 3가지 ㄱ
var done : [Todo] = []
let todoManager = TodoManager()

func SaveData () {
    
    UserDefaults.standard.set(try? PropertyListEncoder().encode(todo), forKey: "todo")
    UserDefaults.standard.set(try? PropertyListEncoder().encode(done), forKey: "done")
    print("데이터 저장")
    
}

func LoadData () {
    if let data = UserDefaults.standard.value(forKey:"todo") as? Data {
        todo = try! PropertyListDecoder().decode([[Todo]].self, from: data)
    }
    if let data = UserDefaults.standard.value(forKey:"done") as? Data {
        done = try! PropertyListDecoder().decode([Todo].self, from: data)
    }
    print("데이터 로드")

}
