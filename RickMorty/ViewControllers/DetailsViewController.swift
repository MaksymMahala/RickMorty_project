//
//  DetailsViewController.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {

    var mainLabel = UILabel()
    var mainView = UIImage()
    
    var selectedLabel: String?
    
    
    var titleLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addtitleLabel()

        constraintTitleLabel()
    }
    
    
    
    
    func addtitleLabel(){
        titleLabel.text = "Details"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
    }


}
extension DetailsViewController{
    func constraintTitleLabel(){
        titleLabel.snp.makeConstraints{ make in
            make.top.top.equalTo(100)
            make.leading.leading.equalTo(20)
            
        }
        
    }
}
