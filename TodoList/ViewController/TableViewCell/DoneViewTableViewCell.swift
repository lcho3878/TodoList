//
//  DoneViewTableViewCell.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/25.
//

import UIKit

class DoneViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var contentLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI (_ celltodo: Todo) {
        categoryLable.text = celltodo.category
        contentLable.text = celltodo.content
    }

}
