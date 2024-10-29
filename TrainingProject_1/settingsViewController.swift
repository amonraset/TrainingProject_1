//
//  settingsViewController.swift
//  TrainingProject_1
//
//  Created by sm on 26.10.2024.
//

import UIKit



class settingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


let words = ["Apple", "Pear", "Watermelon", "Carrot", "Pickle", "Potato", "Tomato"]

extension settingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell.textLabel?.text = words[indexPath.row]
       
       return cell
    }
}


