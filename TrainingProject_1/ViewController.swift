//
//  ViewController.swift
//  TrainingProject_1
//
//  Created by sm on 26.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let stringWeb1 = "https://images.unsplash.com/photo-1729731321939-27a77f7eb238?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    
    let stringWeb2 = "https://images.unsplash.com/photo-1729670690746-af05cd6b3962?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    
    
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
        PictureWeb.layer.cornerRadius = 20
        PictureWeb.layer.borderColor = UIColor.red.cgColor
        
        let string = stringWeb1
        guard let url = URL(string: string) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print ("done")
            guard let data = data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.PictureWeb.image = image
            }
        }
        task.resume()
    }


}

