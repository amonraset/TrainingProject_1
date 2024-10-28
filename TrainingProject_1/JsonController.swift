//
//  JsonController.swift
//  TrainingProject_1
//
//  Created by sm on 28.10.2024.
//

import UIKit

class JsonController: UIViewController {
    
    
    
    @IBOutlet weak var JsonText: UITextView!
    
    @IBAction func loadjson(_ sender: Any) {
        self.JsonText.text = "whats up"
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

