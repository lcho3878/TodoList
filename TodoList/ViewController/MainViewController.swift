//
//  ViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/07/31.
//

import UIKit


class MainViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mytext: UITextField!
    
    @IBAction func scoreButton(_ sender: Any) {
        let score = Score()
        present(score.showScore(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
        let image = UIImage(named: "swift.png")
        imageView.image = image
    }
    
}
