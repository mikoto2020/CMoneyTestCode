//
//  ViewController.swift
//  CMoneyTestCode
//
//  Created by Jeanne on 2021/8/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var list: [ApiModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        parsingData()
    }
    
    func setUp() {
        button.setTitle("Search", for: .normal)
    }

    @IBAction func goToNextPage(_ sender: Any) {
        print("press it.")
        let storyboard = UIStoryboard(name: "SecondView", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondView") as! SecondViewCollectionViewController
        controller.list = list
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func parsingData() {
        let url = URL(string: "https://raw.githubusercontent.com/cmmobile/NasaDataSet/main/apod.json")
        let session = URLSession.shared
        let task = session.dataTask(with: URLRequest(url: url!)) { (data, res, error) in
            if error != nil {
                print("error!")
                return
            }

            guard let list = try? JSONDecoder().decode([ApiModel].self, from: data!) else {
                print("error.")
                return
            }
            
            self.list = list
        }
        task.resume()
        
    }
    
}

