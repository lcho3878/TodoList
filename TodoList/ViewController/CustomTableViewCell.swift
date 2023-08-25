//
//  CustomTableViewCell.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var customSwitch: UISwitch!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var customLable: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        customLable.attributedText = nil
        dateLabel.attributedText = nil
        dateLabel.textColor = .black
    }
    
    func setupUI (_ celltodo: Todo) {
        customLable.text = celltodo.content
        dateLabel.text = celltodo.dueDate
        customSwitch.isOn = celltodo.isComplete
        customSwitch.addTarget(self, action: #selector(toggleSwitch), for: .valueChanged)
        
        if customSwitch.isOn {
            customLable?.attributedText = customLable.text?.strikeThrough()
            dateLabel?.attributedText = dateLabel.text?.strikeThrough()
        }
        
        let today = Date()
        
        if today.toString() > dateLabel?.text ?? "" {
            dateLabel.textColor = .red
        }
    }
    
    @objc func toggleSwitch (_ sender: UISwitch) {
        let index = self.tag
        let section = sender.tag
        if todo[section][index].isComplete == false {
            todo[section][index].isComplete = true
            todo[section][index].completeDate = Date().toString()
        }
        else {
            if todo[section][index].dueDate! != "" {
                if todo[section][index].dueDate! >= todo[section][index].completeDate! {
                    todo[section][index].inDuedate = true
                }
                else {
                    todo[section][index].inDuedate = false
                }
            }
            done.append(todo[section][index])
            todo[section].remove(at: index)
        }
    }
}
