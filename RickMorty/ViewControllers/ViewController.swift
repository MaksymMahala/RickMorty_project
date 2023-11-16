//
//  ViewController.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//

import UIKit

class ViewController: UITableViewController {
    var locations = [LocationUser]()
    var vm = ResponseAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Location"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.green]
        navigationController?.navigationBar.standardAppearance = appearance
        
        
        self.vm.loadAPILocation(){ (result) in
            self.locations = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let textIndex = locations[indexPath.item]
        cell.textLabel?.text = "\(textIndex.name)\n"
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 23)
        cell.textLabel?.numberOfLines = 2
        cell.detailTextLabel?.text = "\(textIndex.type)\n\n\(textIndex.dimension)"
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.numberOfLines = 3
        cell.backgroundColor = .black
        cell.layer.borderColor = CGColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        cell.layer.cornerRadius = 10
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let location = storyboard?.instantiateViewController(withIdentifier: "Location") as? LocationViewController{
            let indexLocation = locations[indexPath.item]
            location.selectedLabel = indexLocation.name
//          location.selectedCharacter = indexLocation.residents
//            location.selectedCharacter = indexLocation.residents
            navigationController?.pushViewController(location, animated: true)
        }
    }
}

