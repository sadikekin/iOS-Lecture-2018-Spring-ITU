//
//  ViewController.swift
//  ImageChangerButton
//
//  Created by Sadik Ekin Ozbay on 2.04.2018.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonItself: UIButton!
    
    var 🥇 : Bool = true
    
    @IBAction func countIt(_ sender: UIButton) {
        sender.setTitle("CLICKED", for: .normal)
        for i in 0..<1000000000000000{
            counter.text = "now: \(i)"
            print(i)
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if (🥇) {
            label.text = "I am Poor"
            label.backgroundColor = UIColor.blue
            image.image = UIImage(named: "coal")
            buttonItself.setTitle("Make me Rich", for: .normal)
            buttonItself.backgroundColor = UIColor.lightGray
            🥇 = false
        }else{
            label.text = "I am Rich"
            label.backgroundColor = UIColor.red
            image.image = UIImage(named: "diamond")
            buttonItself.setTitle("Make me Poor", for: .normal)
            buttonItself.backgroundColor = UIColor.clear
            🥇 = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "I am Rich"
        buttonItself.setTitle("Make me poor", for: .normal)
        image.image = UIImage(named: "diamond")
        
        print("viewDidLoad")
    }


}

