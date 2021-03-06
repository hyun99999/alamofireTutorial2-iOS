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
    @IBAction func onClickedPostBtn(_ sender: Any) {
        postTest()
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
        let url = "https://ptsv2.com/t/eoxz4-1612853643/post"
        let login = [
            "email": "1234@1234.com",
            "password": "1234"
        ] as Dictionary
//        var request = URLRequest(url: URL(string: url)!)
//               request.httpMethod = "POST"
//               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//               request.timeoutInterval = 10
//
//        // httpBody 에 parameters 추가
//        do {
//            //dictionary 를 array,json으로  json,array 를 dictionary 로 변환.
//            try request.httpBody = JSONSerialization.data(withJSONObject: login, options: [])
//        } catch {
//            print("http Body Error")
//        }
        
        AF.request(url,method: .post, parameters: login, encoding: JSONEncoding.default).responseString{ (response) in
            switch response.result{
            case .success:
                print("POST success!")
            case .failure(let err):
                print(err)
            }
        }
    }
}

