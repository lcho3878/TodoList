//
//  TodoViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/03.
//
import UIKit
extension Date{
    func toString() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            return dateFormatter.string(from: self)
    }
}



class TodoViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        TodoView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    var index : Int!
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addButtonAction(_ sender: Any) {
//        let alert = UIAlertController(title: "할일 추가하기.", message: nil , preferredStyle: .alert)
//        alert.addTextField{ (myTextField) in
//            myTextField.placeholder = "할일을 입력해주세요."
//        }
//        alert.addTextField{ (myTextField) in
//            myTextField.placeholder = "목표 날짜를 입력해주세요."
//        }
//        let confirm = UIAlertAction(title: "확인", style: .default){ (ok) in
//            let content = (alert.textFields?[0].text)!
//            let dueDate = (alert.textFields?[1].text)!
//            todo.append(Todo(content: content, dueDate: dueDate ,isComplete: false))
//            self.TodoView.reloadSections(IndexSet(0...0), with: .automatic)
//        }
//        let close = UIAlertAction(title: "닫기", style: .destructive, handler: nil)
//        alert.addAction(confirm)
//        alert.addAction(close)
//        present(alert, animated: true, completion: nil)
        
        todoManager.todoAdd(self)
//        present(alert, animated: true, completion: nil)
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
        let pass = UIAlertAction(title: "완료목록으로 보내기", style: .default) { [self]
            (pass) in
            todoManager.todoPass(self, index)
        }
        let delete = UIAlertAction(title: "삭제하기", style: .destructive) { [self]
            (delete) in
            todoManager.todoDelete(self, index)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(modify)
        if todo[index].isComplete == true {
            alert.addAction(pass)

        }
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
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
        return cell
    }
    @objc func toggleSwitch (sender : UISwitch) {
        let index = sender.tag
        if todo[index].isComplete == false {
            todo[index].isComplete = true
        }
        else {
            done.append(todo[index])
            todo.remove(at: index)
        }
        TodoView.reloadSections(IndexSet(0...0), with: .automatic)
    }
}

