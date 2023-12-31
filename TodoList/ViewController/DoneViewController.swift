//
//  DoneViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/03.
//

import UIKit

class DoneViewController: UIViewController {
    var count = 0 // 이스터에그 발동을 위한 프로퍼티
    var index = -1 // 이스터에그 발동을 위한 프로퍼티
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var DoneView: UITableView!
    
    @IBAction func deleteAction(_ sender: Any) {
        let index = DoneView.indexPathForSelectedRow?.row ?? -1
        if index != -1 {
            let alert = UIAlertController(title: done[index].content, message: "삭제하시겠습니까?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "삭제", style: .destructive){
                (ok) in
                done.remove(at: index)
                SaveData()
                self.DoneView.reloadSections(IndexSet(0...0), with: .automatic)
            }
            let cancel = UIAlertAction(title: "취소", style: .default)
            alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        else{
            let alert = UIAlertController(title: nil, message: "항목을 선택해주세요!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension DoneViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return done.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DoneViewTableViewCell", for: indexPath) as? DoneViewTableViewCell else { return UITableViewCell() }
        let celltodo = done[indexPath.row]
        cell.setupUI(celltodo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if index == indexPath.row {
            count += 1
        }
        else {
            index = indexPath.row
        }
        if count == 5 {
            count = 0
            let alert = UIAlertController(title: nil, message: "이스터에그발견!!!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
}
