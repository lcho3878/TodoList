//
//  Instances.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/11.
//

import Foundation
import UIKit

var todo : [Todo] = []
var done : [Todo] = []
let todoManager = TodoManager()
let UD = UserDefaults()

func SaveData () {
    
    UserDefaults.standard.set(try? PropertyListEncoder().encode(todo), forKey: "todo")
    UserDefaults.standard.set(try? PropertyListEncoder().encode(done), forKey: "done")
    print("데이터 저장")
    
}
func LoadData () {
    if let data = UserDefaults.standard.value(forKey:"todo") as? Data {
        todo = try! PropertyListDecoder().decode([Todo].self, from: data)
    }
    if let data = UserDefaults.standard.value(forKey:"done") as? Data {
        done = try! PropertyListDecoder().decode([Todo].self, from: data)
    }
    print("데이터 로드")

}
//var todo: [Todo] {
//    get {
//        var todo: [Todo]?
//        if let data = UserDefaults.standard.value(forKey:"todo") as? Data {
//            todo = try? PropertyListDecoder().decode([Todo].self, from: data)
//        }
//        return todo ?? []
//    }
//    set {
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey:"todo")
//    }
//}
//var done : [Todo] {
//    get {
//        var done : [Todo]?
//        if let data = UserDefaults.standard.value(forKey: "done") as? Data {
//            done = try? PropertyListDecoder().decode([Todo].self, from: data)
//        }
//        return done ?? []
//    }
//    set{
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "done")
//    }
//}
