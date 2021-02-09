//
//  ViewController.swift
//  alamofireTutorial2-iOS
//
//  Created by kimhyungyu on 2021/02/09.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: - IBAction
    @IBAction func onClickedGetBtn(_ sender: Any) {
        getTest()
    }
    //MARK: - GET,POST methods
    func getTest() {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url).validate(statusCode: 200..<300)
            .responseJSON{
                (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let userId = json["userId"].intValue
                    let id = json["id"].intValue
                    let title = json["title"].stringValue
                    print("ViewController - GET")
                    
                    self.userIdLabel.text = String(userId)
                    self.idLabel.text = String(id)
                    self.titleLabel.text = title
                    
                case .failure(let err):
                    //나라별 언어로 표현.
                    print(err.localizedDescription)
                }
            }
    }
    func postTest() {
        let url = "/t/nzzq2-1612844842/post"
        
        
    }

}

