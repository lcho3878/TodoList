//
//  ViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/07/31.
//

import Alamofire
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
        //네트워크 이미지 로드
        let imageUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"
        AF.request(imageUrl).response { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async{
                    self.imageView.image = UIImage(data: data!)
                }
            case .failure(let error):
                print("이미지 로드 실패 : \(error)")
            }
        }
        
    }
    
}
