//
//  AddViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/10.
//

import UIKit

class AddViewController: UIViewController {
    
    var category = "공부"
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var customLabel1: UITextField!
    @IBOutlet weak var customLable2: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        let newTodo = Todo(category: category, content: customLabel1.text!, dueDate : customLable2.text, isComplete: false)
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
    
    func SetupCategoryMenu () {
        let study = UIAction(title: "공부", handler: { _ in
            self.categoryButton.setTitle("공부", for: .normal)
            self.category = "공부"
        })
        let project = UIAction(title: "프로젝트", handler: { _ in
            self.categoryButton.setTitle("프로젝트", for: .normal)
            self.category = "프로젝트"
        })
        let life = UIAction(title: "일상", handler: { _ in
            self.categoryButton.setTitle("일상", for: .normal)
            self.category = "일상"
        })
        let etc = UIAction(title: "기타", handler: { _ in
            self.categoryButton.setTitle("기타", for: .normal)
            self.category = "기타"
        })
        let menu = UIMenu(title: "", children: [study, project, life, etc])
        categoryButton.setTitle("공부", for: .normal)
        categoryButton.menu = menu
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.preferredDatePickerStyle = .wheels
        datepicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        customLable2.inputView = datepicker
        SetupCategoryMenu()
    }
}
