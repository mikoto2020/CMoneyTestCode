//
//  DetailContentViewController.swift
//  CMoneyTestCode
//
//  Created by Jeanne on 2021/8/28.
//

import UIKit

class DetailContentViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    var itemDetail: ApiModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        dlPicture()
    }
    
    func setUp() {
        if let itemDetail = self.itemDetail {
            dateLabel.text = dateFormat(string: itemDetail.date)
            titleLabel.text = itemDetail.title
            descriptionTextView.text = itemDetail.description
            copyrightLabel.text = itemDetail.copyright
        }
        copyrightLabel.font = UIFont.systemFont(ofSize: 10)
        copyrightLabel.textColor = .lightGray

    }
    
    func dateFormat(string: String) -> String {
        let dateFormat = "yyyy-MM-dd"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let date = formatter.date(from: string)
                
        formatter.dateFormat = "YYYY MMM. dd"
        let newDate = formatter.string(from: date!)
        return newDate
    }
    
    func dlPicture() {
        let url = URL(string: itemDetail!.hdurl)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
          if let data = data, let image = UIImage(data: data) {
             DispatchQueue.main.async {
                self.imageView.image = image
             }
          }
       }
       task.resume()
    }


}
