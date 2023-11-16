//
//  LocationViewController.swift
//  RickMorty
//
//  Created by Maksym on 15.11.2023.
//

import UIKit

class LocationViewController: UIViewController {
    var selectedLabel: String?
    
    var contentView = UIView()
    var scrollView = UIScrollView()
    var mainView = UIView()
    
    var residentsLabel = UILabel()
    var imageCharacter = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        title = selectedLabel
    
        addScollView()
        constraintScrollView()
        
        addMainView()
        constraintMainView()
    
        addResidentsLabel()
       
    }
    func addScollView(){
        scrollView.alwaysBounceHorizontal = true
        scrollView.automaticallyAdjustsScrollIndicatorInsets = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
    }
    func addMainView(){
        mainView.backgroundColor = .white
        mainView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(mainView)
    }
    func addResidentsLabel(){
        residentsLabel.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(residentsLabel)
    }
    func addImageCharacter(){
        imageCharacter.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(imageCharacter)
    }
    

}
extension LocationViewController{
    func constraintScrollView(){
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(view.snp_topMargin)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(350)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func constraintMainView() {
        mainView.snp.makeConstraints{ make in
            make.top.equalTo(scrollView.snp.topMargin)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.width.equalTo(1200)
            make.height.equalTo(350)
        }
    }
    func configure(with imageURL: URL) {
        imageCharacter.sd_setImage(with: imageURL, placeholderImage: UIImage(systemName: "heart"))
        imageCharacter.contentMode = .scaleToFill
        imageCharacter.layer.cornerRadius = 13
    }
}
