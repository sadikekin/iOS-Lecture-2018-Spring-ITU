//
//  ViewController.swift
//  jumping jack
//
//  Created by Sadik Ekin Ozbay on 1.04.2018.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var IsJumping : Bool = false
    @IBAction func buttonClicked(_ sender: UIButton) {
        if IsJumping {
            jumpImage.image = UIImage(named: "standing")
            buttonItself.setTitle("Jump", for: .normal)
            IsJumping = false
        }else{
            jumpImage.image = UIImage(named: "jumping")
            buttonItself.setTitle("Stand", for: .normal)
            IsJumping = true
        }
    }
    
    @IBOutlet weak var jumpImage: UIImageView!
    @IBOutlet weak var buttonItself: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

