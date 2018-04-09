//
//  ViewController.swift
//  Dice Game
//
//  Created by Sadik Ekin Ozbay on 9.04.2018.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func buttonClicked(_ sender: UIButton) {
    }
    
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue identifier \(segue.identifier)")
        if let gameVC = segue.destination as? GameViewController {
            gameVC.givenInput = Int(input.text!)!
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let inputData = Int(input.text ?? "-1") ?? -1
        if inputData <= 0 || inputData > 6{
            let alert = UIAlertController(title: "Wrong Number", message: "0 > Number should be <= 6", preferredStyle: .alert)
            let okbutton = UIAlertAction(title: "Okay", style: .cancel) { (alert) in
                print("Okay is clicked")
            }
            alert.addAction(okbutton)
            present(alert, animated: true, completion: nil)
            return false
        }else{
            return true
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

