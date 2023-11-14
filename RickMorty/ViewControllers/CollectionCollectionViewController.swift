//
//  CollectionCollectionViewController.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    var model = [Model]()
    var vm = ResponseAPI()

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.navigationBar.prefersLargeTitles = true

           let appearance = UINavigationBarAppearance()
           appearance.backgroundColor = UIColor(named: "Color")
           appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           navigationController?.navigationBar.tintColor = .white
           navigationController?.navigationBar.standardAppearance = appearance
           navigationController?.navigationBar.compactAppearance = appearance
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
   }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Rick and Morty"
        
        
            self.vm.loadAPI(){ (result) in
                self.model = result
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
            }
        }

    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        let titleRow = model[indexPath.item]
        cell.labelView.text = titleRow.name
        let urlImage = URL(string: titleRow.image)!
        cell.configure(with: urlImage)
        cell.layer.cornerRadius = 12
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let details = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsViewController{
            let itemIndex = model[indexPath.item]
            details.selectedLabel = itemIndex.name
            details.mainImage = itemIndex.image
            details.selectedStatus = itemIndex.status
            navigationController?.pushViewController(details, animated: true)
        }
    }

}
