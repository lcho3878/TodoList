//
//  Todo.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/09.
//

import Foundation
import UIKit

class Todo : Codable {
    var content : String
    var dueDate : String?
    var isComplete : Bool
    var completeDate : String?
    var inDuedate : Bool?
    init(content: String, dueDate: String? = nil, isComplete: Bool, inDuedate : Bool? = nil, completeDate : String? = nil) {
        self.content = content
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.inDuedate = inDuedate
        self.completeDate = completeDate
    }
}
