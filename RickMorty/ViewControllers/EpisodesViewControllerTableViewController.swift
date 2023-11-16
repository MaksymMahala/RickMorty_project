//
//  EpisodesViewControllerTableViewController.swift
//  RickMorty
//
//  Created by Maksym on 14.11.2023.
//

import UIKit

class EpisodesViewController: UITableViewController {
    var episode = [Episode]()
    var vm = ResponseAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episodes"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.green]
        navigationController?.navigationBar.standardAppearance = appearance
        
        
        self.vm.loadAPIEpisode(){ (result) in
            self.episode = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episode.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let textIndex = episode[indexPath.item]
        cell.textLabel?.text = "\(textIndex.episode)\n \nEpisode: \(textIndex.name)\n"
        cell.textLabel?.numberOfLines = 4
        cell.detailTextLabel?.text = "Aired on \(textIndex.air_date)"
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .gray
        cell.backgroundColor = .black
        cell.layer.borderColor = CGColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1)
        cell.layer.borderWidth = 1
        cell.layer.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        cell.layer.cornerRadius = 10
        return cell
    }

}
