//
//  CatCollectionViewController.swift
//  TodoList
//
//  Created by t2023-m079 on 2023/08/28.
//

import UIKit

class CatCollectionViewController: UIViewController {
    var index: Int?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension CatCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catImageDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatVCollectionViewCell", for: indexPath) as? CatVCollectionViewCell else {
            return UICollectionViewCell()
        }
        let catImage = catImageDatas[indexPath.row]
        cell.catImage.image = UIImage(data: catImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        let alert = UIAlertController(title: "정말로 삭제하시겠습니까?", message: nil, preferredStyle: .alert)
        let delete = UIAlertAction(title: "삭제", style: .destructive, handler: { delete in
            catImageDatas.remove(at: self.index!)
            SaveData()
            self.collectionView.reloadSections(IndexSet(0...0))
        })
        let cancel = UIAlertAction(title: "취소", style: .default, handler: { cancel in
        })
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true)
        
    }
    
    
}
