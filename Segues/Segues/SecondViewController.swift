//
//  SecondViewController.swift
//  Segues
//
//  Created by msingh on 5/20/18.
//  Copyright © 2018 rockitman. All rights reserved.
//

import UIKit

protocol  CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {
    
    var delegate : CanReceive?
    var data = ""

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var chimeBack: UIButton!
    @IBOutlet weak var secondViewTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataReceived(data: secondViewTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
