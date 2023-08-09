//
//  Todo.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/09.
//

import Foundation

var todo : [Todo] = [Todo(content: "TIL작성", dueDate: "2023-08-06" , isComplete: false)]
var done : [Todo] = []
class Todo {
    var content : String
    var dueDate : String?
    var isComplete : Bool
    init(content: String, dueDate: String? = nil, isComplete: Bool) {
        self.content = content
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}

