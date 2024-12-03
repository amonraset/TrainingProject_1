//
//  JsonController.swift
//  TrainingProject_1
//
//  Created by sm on 28.10.2024.
//

import UIKit
import ProgressHUD


class JsonController: UIViewController {
    
    
    
    @IBOutlet weak var JsonText: UITextView!
    
    
    @IBAction func loadjson(_ sender: Any) {
       
        //метод серверного запроса с замыканием
        ProgressHUD.animate()
        load { text1, text2 in  //кортеж изучить тему!!!!
            self.JsonText.text = "\(text1), \(text2)"
        }
        ProgressHUD.dismiss()
        
        //load(completion: { self.JsonText.text = "\($0), \($1)" })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    struct SpaceInfo: Decodable {
        let message: String
        let number: Int
        let people: [Astronaut]
    }
    
    struct Astronaut: Decodable {
        let name: String
        let craft: String
    }
    
    func load(completion: @escaping (String, String) -> Void) { //СБегающее замыкание
        
        let stringUrl = "http://api.open-notify.org/astros.json"
        guard let url = URL(string: stringUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "noDesc")
                return
            }
            guard let Data = data else { return }
            guard let spaceInfo = try? JSONDecoder().decode(SpaceInfo.self, from: Data) else {
                print ("Error parse SpaceInfo")
                return }
           let text01 = "\(spaceInfo.number), \(spaceInfo.message)"
            let uniqueSpaceCrafts = Set (spaceInfo.people.map { $0.craft})
           let text02 = "Spacecraft: \(uniqueSpaceCrafts.joined(separator: ", "))"
            
            DispatchQueue.main.async {
                completion(text01, text02)
            }
        }
        task.resume ()
    }
}
