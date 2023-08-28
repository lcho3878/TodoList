//
//  Instances.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/11.
//

import Foundation
import UIKit

var todo_delete : [Todo] = []
var todo : [[Todo]] = [[], [], [], []] //공부, 프로젝트, 일상, 기타 4가지 카테고리
var done : [Todo] = []
var catImageDatas: [Data] = []
let todoManager = TodoManager()

func SaveData () {
    
    UserDefaults.standard.set(try? PropertyListEncoder().encode(todo), forKey: "todo")
    UserDefaults.standard.set(try? PropertyListEncoder().encode(done), forKey: "done")
    UserDefaults.standard.set(try? PropertyListEncoder().encode(catImageDatas), forKey: "catImages")
    print("데이터 저장")
    
}

func LoadData () {
    if let data = UserDefaults.standard.value(forKey:"todo") as? Data {
        todo = try! PropertyListDecoder().decode([[Todo]].self, from: data)
    }
    if let data = UserDefaults.standard.value(forKey:"done") as? Data {
        done = try! PropertyListDecoder().decode([Todo].self, from: data)
    }
    if let data = UserDefaults.standard.value(forKey: "catImages") as? Data {
        catImageDatas = try! PropertyListDecoder().decode([Data].self, from: data)
    }
    print("데이터 로드")

}
