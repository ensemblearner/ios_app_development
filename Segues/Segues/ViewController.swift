//
//  ViewController.swift
//  Segues
//
//  Created by msingh on 5/20/18.
//  Copyright © 2018 rockitman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {

    @IBOutlet weak var askMe: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen"{
            let destinationVC =  segue.destination as! SecondViewController
            destinationVC.data = textField.text!
            destinationVC.delegate = self
            
        }
        
    }
    
    func dataReceived(data: String) {
       label.text = data
    }
}

