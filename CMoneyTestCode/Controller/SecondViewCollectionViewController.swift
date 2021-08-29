//
//  SecondViewCollectionViewController.swift
//  CMoneyTestCode
//
//  Created by Jeanne on 2021/8/28.
//

import UIKit

class SecondViewCollectionViewController: UICollectionViewController {
    
    var list: [ApiModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SecondViewCollectionViewCell.self)", for: indexPath) as! SecondViewCollectionViewCell
        
        let url = URL(string: list[indexPath.row].url)!
        let tempDirectory = FileManager.default.temporaryDirectory
        let imageFileUrl = tempDirectory.appendingPathComponent(url.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: imageFileUrl.path) {
           let image = UIImage(contentsOfFile: imageFileUrl.path)
           cell.imageView.image = image
        } else {
            print("dl\(indexPath.row)")
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
              if let data = data, let image = UIImage(data: data) {
                try? data.write(to: imageFileUrl)
                 DispatchQueue.main.async {
                    cell.imageView.image = image
                 }
              }
           }
           task.resume()
        }
        
        cell.titleLabel.text = list[indexPath.row].title
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("click.\(indexPath.row)")
        
        let storyboard = UIStoryboard(name: "DetailContentView", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailContentView") as! DetailContentViewController
        
        controller.itemDetail = list[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
        
        return true
    }
}
