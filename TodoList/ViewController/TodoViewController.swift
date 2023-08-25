//
//  TodoViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/03.
//
import UIKit

class TodoViewController : UIViewController {
    var index : Int!
    var section: Int!
    @IBOutlet weak var TodoView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TodoView.reloadSections(IndexSet(0...3), with: .automatic)
    }
    
}
extension TodoViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String
        if section == 0 {
            title = "공부"
        }
        else if section == 1 {
            title = "프로젝트"
        }
        else if section == 2 {
            title = "일상"
        }
        else {
            title = "기타"
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return todo_delete.count
        var count: Int = 0
        if section == 0 {
            count = todo[0].count
        }
        else if section == 1 {
            count = todo[1].count
        }
        else if section == 2 {
            count = todo[2].count
        }
        else if section == 3 {
            count = todo[3].count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        section = indexPath.section
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
            detailViewController.section = section
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        section = indexPath.section
        index = indexPath.row
        let celltodo = todo[section][index]
        cell.tag = index
        cell.customSwitch.tag = section
        cell.setupUI(celltodo)
        cell.customSwitch.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
        return cell
    }
    
    @objc func toggleSwitch (_ sender: UISwitch) {
        TodoView.reloadSections(IndexSet(sender.tag...sender.tag), with: .automatic)
    }
    
}

