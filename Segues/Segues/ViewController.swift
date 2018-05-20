//
//  ViewController.swift
//  Segues
//
//  Created by msingh on 5/20/18.
//  Copyright © 2018 rockitman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToThirdScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen"{
            let destinationVC =  segue.destination as! SecondViewController
            destinationVC.textPassedOver = textField.text!
            
        }
        
    }
}

