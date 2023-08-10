//
//  Todo.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/09.
//

import Foundation
import UIKit

var todo : [Todo] = [Todo(content: "TIL작성", dueDate: "2023-08-06" , isComplete: false)]
var done : [Todo] = []
class Todo {
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
let todoManager = TodoManager()
class TodoManager {
     
    func todoAdd (_ tableViewController: TodoViewController, _ datepicker : UIDatePicker) {
        let alert = UIAlertController(title: "할일 추가하기.", message: nil , preferredStyle: .alert)
        alert.addTextField{ (myTextField) in
            myTextField.placeholder = "할일을 입력해주세요."
        }
        alert.addTextField{(myTextField) in
            myTextField.placeholder = "목표 날짜를 입력해주세요."
        }
        let confirm = UIAlertAction(title: "확인", style: .default){ (ok) in
            let content = (alert.textFields?[0].text)!
            let dueDate = (alert.textFields?[1].text)!
            todo.append(Todo(content: content, dueDate: dueDate ,isComplete: false))
            tableViewController.TodoView.reloadSections(IndexSet(0...0), with: .automatic)
        }
        let close = UIAlertAction(title: "닫기", style: .destructive, handler: nil)
        alert.addAction(confirm)
        alert.addAction(close)
        tableViewController.present(alert, animated: true, completion: nil)
    }
    func todoPass (_ tableViewController: TodoViewController, _ index : Int) {
        done.append(todo[index])
        todo.remove(at: index)
        tableViewController.TodoView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    func todoDelete (_ tableViewController: TodoViewController, _ index : Int) {
        todo.remove(at: index)
        tableViewController.TodoView.reloadSections(IndexSet(0...0), with: .automatic)
    }
}
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
}
