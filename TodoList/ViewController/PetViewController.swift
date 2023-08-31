//
//  PetViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/25.
//

import UIKit
import Alamofire

struct Example: Decodable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}

class PetViewController: UIViewController {
    var imageData: Data?
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var petImageView: UIImageView!
    @IBAction func showCatButton(_ sender: Any) {
        ShowCat()
    }
    
    @IBAction func saveCatButton(_ sender: Any) {
        catImageDatas.append(imageData!)
        SaveData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowCat()
    }
    
    func ShowCat() {
        print("로딩중")
        self.petImageView.isHidden = true
        self.loadingLabel.isHidden = false
        // 1. URL 생성
        let apiUrl = URL(string: "https://api.thecatapi.com/v1/images/search")

        // 2. URLSession 인스턴스 생성
        let session = URLSession.shared

        // 3. Data Task 생성
        let dataTask = session.dataTask(with: apiUrl!) { (data, response, error)  in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // 4. 데이터 처리
            if let data = data {
                // 데이터 파싱 및 활용
                do {
                    let apiData: [Example] = try JSONDecoder().decode([Example].self, from: data)
                    let imageURL = URL(string: apiData[0].url)
                    let imageData = try Data(contentsOf: imageURL!)
                    DispatchQueue.main.async {
                        self.petImageView.image = UIImage(data: imageData)
                        self.imageData = imageData
                        self.loadingLabel.isHidden = true
                        self.petImageView.isHidden = false
                        print("로딩완료")
                    }
//                    AF를 이용한 방법
//                    AF.request(imageURL!).response { response in
//                        switch response.result {
//                        case .success(let data):
//                            DispatchQueue.main.async{
//                                self.petImageView.image = UIImage(data: data!)
//                                self.loadingLabel.is
//                            }
//                        case .failure(let error):
//                            print("이미지 로드 실패 : \(error)")
//                        }
//                    }
                }
                
                catch let error {
                    print(error)
                }
            }
        }

        // 5. Data Task 실행
        dataTask.resume()
    }
}
