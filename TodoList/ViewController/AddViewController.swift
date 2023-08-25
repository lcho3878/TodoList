//
//  AddViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/10.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var customLabel1: UITextField!
    @IBOutlet weak var customLable2: UITextField!
    @IBAction func saveButton(_ sender: Any) {
//        todo_delete.append(Todo(category: "공부", content: customLabel1.text!, dueDate : customLable2.text, isComplete: false))
        let newTodo = Todo(category: category.text!, content: customLabel1.text!, dueDate : customLable2.text, isComplete: false)
        let section: Int
        switch newTodo.category {
        case "공부":
            section = 0
        case "프로젝트":
            section = 1
        case "일상":
            section = 2
        default:
            section = 3
        }
        todo[section].append(newTodo)
        SaveData()
        self.navigationController?.popViewController(animated: true)
    }
    @objc func dateChange(_ sender : UIDatePicker) {
        customLable2.text = sender.date.toString()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.preferredDatePickerStyle = .wheels
        datepicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        customLable2.inputView = datepicker
    }
}
