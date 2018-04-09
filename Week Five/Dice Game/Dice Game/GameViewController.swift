//
//  GameViewController.swift
//  Dice Game
//
//  Created by Sadik Ekin Ozbay on 9.04.2018.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBAction func removeVC(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var winOrLose: UIImageView!
    
    @IBOutlet weak var diceImage: UIImageView!
    
    @IBOutlet weak var winOrLoseLabel: UILabel!
    
    var givenInput = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomInt = arc4random_uniform(6) + 1
        diceImage.image = UIImage(named: "dice-\(randomInt)")
        
        if(randomInt == givenInput){
            winOrLose.image = UIImage(named: "happy")
            winOrLoseLabel.text = "YOU WINNN"
        }else{
            winOrLose.image = UIImage(named: "sad")
            winOrLoseLabel.text = "LOSER"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
