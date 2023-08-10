//
//  AddViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/10.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let datepicker = UIDatePicker()
        datepicker.datePickerMode = .date
        datepicker.preferredDatePickerStyle = .wheels
        datepicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        customLable2.inputView = datepicker
    }

    @IBOutlet weak var customLabel1: UITextField!
    @IBOutlet weak var customLable2: UITextField!
    @IBAction func saveButton(_ sender: Any) {
        todo.append(Todo(content: customLabel1.text!, dueDate : customLable2.text, isComplete: false))
        self.navigationController?.popViewController(animated: true)
    }
    @objc func dateChange(_ sender : UIDatePicker) {
        customLable2.text = sender.date.toString()
    }
}
