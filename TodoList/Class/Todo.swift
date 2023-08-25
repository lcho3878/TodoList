//
//  Todo.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/09.
//

import Foundation
import UIKit

class Todo : Codable {
    var category: String
    var content : String
    var dueDate : String?
    var isComplete : Bool
    var completeDate : String?
    var inDuedate : Bool?
    init(category: String, content: String, dueDate: String? = nil, isComplete: Bool, inDuedate : Bool? = nil, completeDate : String? = nil) {
        self.category = category
        self.content = content
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.inDuedate = inDuedate
        self.completeDate = completeDate
    }
}

extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.category == rhs.category && lhs.content == rhs.content && lhs.dueDate == rhs.dueDate
    }
    
    
}


