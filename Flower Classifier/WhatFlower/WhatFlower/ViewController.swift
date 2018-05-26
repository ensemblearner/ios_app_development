//
//  ViewController.swift
//  WhatFlower
//
//  Created by msingh on 5/25/18.
//  Copyright © 2018 rockitman. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let wikipediaURL =  "https://en.wikipedia.org/w/api.php"
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var pickedImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary //.camera
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let userPickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            guard let convertedCIImage = CIImage(image: userPickedImage) else{
                fatalError("Could not convert given image to CIImage")
            }
            
            
            detect(image: convertedCIImage)
            //imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion:nil)
    }

   
    func detect(image: CIImage){
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else{
            fatalError("error loading ML Model")
        }
        
        let request = VNCoreMLRequest(model: model) {(request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else{
                fatalError("Could not classify image")
            }
            self.navigationItem.title = classification.identifier.capitalized
            self.requestInfo(flowerName: classification.identifier)
        }
        
        let handler = VNImageRequestHandler(ciImage:image)
        do{
            try handler.perform([request])
        }
        catch{
           print(error)
        }
        
    }
    
    func requestInfo(flowerName: String){
        let parameters :[String: String] = ["format": "json",
                                            "action": "query",
                                            "prop": "extracts|pageimages",
                                            "exintro": "",
                                            "explaintext": "",
                                            "titles" :flowerName,
                                            "indexpageids": "",
                                            "redirects": "1",
                                            "pithumbsize":"500"]
        
        
        Alamofire.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                print("got wiki info")
                print(response)
                
                let flowerJSON : JSON = JSON(response.result.value!)
                let pageid = flowerJSON["query"]["pageids"][0].stringValue
                let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
                
                let flowerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                self.label.text = flowerDescription
                self.imageView.sd_setImage(with: URL(string: flowerImageURL))
                
                
            }
        }
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

