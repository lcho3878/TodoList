//
//  ViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/07/31.
//

import UIKit


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "swift.png")
        imageView.image = image
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func scoreButton(_ sender: Any) {
        present(score.showScore(), animated: true)
    }
}

