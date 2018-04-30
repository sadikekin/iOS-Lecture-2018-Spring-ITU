//
//  ViewController.swift
//  WeekSeven
//
//  Created by Sadik Ekin Ozbay on 30.04.2018.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonIsClicked(_ sender: UIButton) {
        let tought = textField.text ?? ""
        self.ref.setValue(["Dilara": tought, "ekin" : "SELAMAMAMASMDF"])
        sender.setTitleColor(UIColor.red, for: .normal)
    }
    var ref: DatabaseReference!
    
    var tableViewArray = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dilaraCell", for: indexPath)
        cell.textLabel?.text = tableViewArray[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row \(indexPath.item)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.height-200))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "dilaraCell")
        
        self.view.addSubview(tableView)
        
        ref = Database.database().reference()
        
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//
//            let value = JSON(snapshot.value)
//            for (key,subJson):(String, JSON) in value {
//                self.tableViewArray.append("\(key):  \(subJson.description)")
//            }
//            tableView.reloadData()
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
        ref.observe(.value, with: { (snapshot) in
            let value = JSON(snapshot.value)
            self.tableViewArray = []
            for (key,subJson):(String, JSON) in value {
                self.tableViewArray.append("\(key):  \(subJson.description)")
            }
            tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

