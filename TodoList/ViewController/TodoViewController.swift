//
//  TodoViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/03.
//
import UIKit

class TodoViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        TodoView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    var alert = UIAlertController(title: "New Todo", message: nil, preferredStyle: .alert)
    var index : Int!
    @objc func dateChange (_ sender : UIDatePicker) {
        
    }
    @IBOutlet weak var TodoView: UITableView!
}
extension TodoViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        index = indexPath.row
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let modify = UIAlertAction(title: "수정하기", style: .default) { [self]
            (modify) in
            performSegue(withIdentifier: "TableToDetail", sender: self)
        }
        let delete = UIAlertAction(title: "삭제하기", style: .destructive) { [self]
            (delete) in
            todoManager.todoDelete(self, index)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(modify)
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableToDetail" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.index = index
        }
    }
    fileprivate func extractedFunc(_ cell: CustomTableViewCell, _ index: Int) {
        cell.customSwitch.addTarget(self, action: #selector(self.toggleSwitch(sender:)), for: .valueChanged)
        cell.customLable.text = todo[index].content
        cell.dateLabel.text = todo[index].dueDate
        cell.customSwitch.isOn = todo[index].isComplete
        cell.customSwitch.tag = index
        if cell.customSwitch.isOn {
            cell.customLable?.attributedText = cell.customLable.text?.strikeThrough()
            cell.dateLabel?.attributedText = cell.dateLabel.text?.strikeThrough()
        }
        let today = Date()
        if today.toString() > cell.dateLabel.text! {
            cell.dateLabel.textColor = .red
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
        extractedFunc(cell, index)
        return cell
    }
    @objc func toggleSwitch (sender : UISwitch) {
        let index = sender.tag
        if todo[index].isComplete == false {
            todo[index].isComplete = true
            todo[index].completeDate = Date().toString()
        }
        else {
            if todo[index].dueDate! != "" {
                if todo[index].dueDate! >= todo[index].completeDate! {
                    todo[index].inDuedate = true
                }
                else {
                    todo[index].inDuedate = false
                }
            }
            done.append(todo[index])
            todo.remove(at: index)
            //이제 DoneView로 넘어간뒤 점수 만들고 점수 합계 구하기 하면됨
        }
        TodoView.reloadSections(IndexSet(0...0), with: .automatic)
    }
}

