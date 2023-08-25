//
//  DetailViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/07.
//

import UIKit

class DetailViewController : UIViewController {
    var content : String!
    var section: Int!
    var index : Int!
    var date : String!
    var category: String?
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var DetailView: UIView!
    @IBOutlet weak var customTextfield1: UITextField!
    @IBOutlet weak var customTextfield2: UITextField!
    
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
        categoryButton.setTitle(category, for: .normal)
        categoryButton.menu = menu
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        category = todo[section][index].category
        categoryButton.setTitle(category, for: .normal)
        SetupCategoryMenu()
        customTextfield1.text = todo[section][index].content
        customTextfield2.text = todo[section][index].dueDate
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.preferredDatePickerStyle = .wheels
        datepicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        customTextfield2.inputView = datepicker
        
    }
    
    @objc func dateChange (_ sender : UIDatePicker) {
        customTextfield2.text = sender.date.toString()
    }

    @IBAction func Save(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "수정하시겠습니까?" , preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default) { (ok) in
            var newSection: Int
            
            switch self.category {
            case "공부": newSection = 0
            case "프로젝트": newSection = 1
            case "일상": newSection = 2
            default: newSection = 3
            }
            todo[self.section][self.index].content = self.customTextfield1.text!
            todo[self.section][self.index].dueDate = self.customTextfield2.text!
            if self.section != newSection {
                let tempTodo = todo[self.section][self.index]
                todo[newSection].append(tempTodo)
                todo[self.section].remove(at: self.index)
            }
            SaveData()
            self.navigationController?.popViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}
