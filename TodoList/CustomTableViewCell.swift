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
}
