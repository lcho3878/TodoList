//
//  ViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/07/31.
//

import UIKit
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

var todoData = ["TIL작성", "강의 수강하기", "알고리즘 문제풀기"]
var todoComplete = [false, false, false]
var doneData = ["프로젝트 회고록 작성하기", "WIL 작성하기"]
var todoDue = ["2023-08-06", "2023-08-07", "2023-08-08"]

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "swift.png")
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imageView: UIImageView!
    
}

