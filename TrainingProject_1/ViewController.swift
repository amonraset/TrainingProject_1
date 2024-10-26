//
//  ViewController.swift
//  TrainingProject_1
//
//  Created by sm on 26.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var PictureWeb: UIImageView!
    
    @IBAction func LoadButton(_ sender: Any) {
        print("load")
    }
    @IBOutlet weak var LoadButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        PictureWeb.layer.masksToBounds = false
        PictureWeb.layer.borderWidth = 8
        PictureWeb.layer.cornerRadius = 22
        PictureWeb.layer.borderColor = UIColor.red.cgColor
        
        let string = "https://images.unsplash.com/photo-1729731321939-27a77f7eb238?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        guard let url = URL(string: string) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print ("done")
            guard let data = data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.pictereFromeWeb.image = image
            }
        }
        task.resume()
    }


}

