//
//  MainTwoVC.swift
//  Week Six
//
//  Created by Sadik Ekin Ozbay on 16.04.2018.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class MainTwoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    let loader = NVActivityIndicatorView(frame: CGRect(x: 100, y: 300, width: 64, height: 64), type: .pacman, color: .red, padding: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loader)
        self.view.addSubview(tableView)
        fetchData()
    }
    
    func fetchData() {
        let header = [
            "accept": "application/json",
            "apikey": ""
        ]
        loader.startAnimating()
        Alamofire.request("https://api.hurriyet.com.tr/v1/articles", headers: header).responseJSON { response in
            if let json = response.result.value {
                let jsonData = JSON(json)
                //self.label.text = jsonData[0]["Title"].string
                self.loader.stopAnimating()
            }
        }
    }

}
