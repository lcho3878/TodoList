//
//  DoneViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/03.
//

import UIKit

class DoneViewController: UIViewController {
    var count = 0
    var index = -1
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var DoneView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func deleteAction(_ sender: Any) {
        let index = DoneView.indexPathForSelectedRow?.row ?? -1
        if index != -1 {
            let alert = UIAlertController(title: doneData[index], message: "삭제하시겠습니까?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "삭제", style: .destructive){
                (ok) in
                doneData.remove(at: index)
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
}
extension DoneViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doneData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.customLable.text = doneData[indexPath.row]
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
            let alert = UIAlertController(title: nil, message: "우와짝짝짝!!!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
}
