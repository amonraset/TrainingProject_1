//
//  JsonController.swift
//  TrainingProject_1
//
//  Created by sm on 28.10.2024.
//

import UIKit

class JsonController: UIViewController {
    
    struct SpaceInfo: Decodable {
        let message: String
        let number: Int
    }
    
    
    @IBOutlet weak var JsonText: UITextView!
    @IBAction func loadjson(_ sender: Any) {
        self.JsonText.text = "whats up"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func loadJson(){
        let stringUrl = "http://open-notify.org/Open-Notify-API/People-In-Space/"
        guard let url = URL(string: stringUrl) else { return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "noDesc")
            return }
            guard let data = data else { return }
            guard let spaceInfo = try? JSONDecoder().decode(SpaceInfo.self, from: data) else { print ("Error = cant parse Space Info")
                return
            }
            let y = JsonController.SpaceInfo.init(message: <#T##String#>, number: <#T##Int#>)
        }
        
    }
    
}
