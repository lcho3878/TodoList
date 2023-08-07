//
//  DetailViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/07.
//

import UIKit

class DetailViewController : UIViewController {
    var content : String!
    var index : Int!
    var date : String!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var DetailView: UIView!
    @IBOutlet weak var customTextfield1: UITextField!
    @IBOutlet weak var customTextfield2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        customTextfield1.text = content
        customTextfield2.text = date
    }
    @IBAction func Save(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "수정하시겠습니까?" , preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default) { (ok) in
            todoData[self.index] = self.customTextfield1.text!
            todoDue[self.index] = self.customTextfield2.text!
            self.navigationController?.popViewController(animated: true)
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
