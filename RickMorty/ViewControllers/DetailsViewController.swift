//
//  DetailsViewController.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    var selectedLabel: String?
    var mainImage: String!
    
    var contentView = UIView()
    var scrollView = UIScrollView()
    var mainView = UIView()
    var imageBack = UIImageView()
    
    
    var detailsView1 = UIView()
    var detailsView2 = UIView()
    var detailsView3 = UIView()
    var detailsView4 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedLabel
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        addScollView()
        constraintScrollView()
        addContentView()
        constraintContentView()
        

        addMainView()
        constraintMainView()
        
        addImageBack()
        constraintImageBack()
        
        addDetailsView1()
        constraintDetailsView1()
        addDetailsView2()
        constraintDetailsView2()
    }
    func addScollView(){
        scrollView.alwaysBounceVertical = true
        scrollView.automaticallyAdjustsScrollIndicatorInsets = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
    }
    func addContentView(){
        contentView.backgroundColor = UIColor(named: "details")
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
    }
    func addImageBack(){
        let urlImage = URL(string: mainImage)!
        imageBack.load(url: urlImage)
        imageBack.contentMode = .scaleToFill
        imageBack.translatesAutoresizingMaskIntoConstraints = false
        imageBack.layer.borderWidth = 5
        imageBack.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.addSubview(imageBack)
    }
    func addMainView(){
        mainView.backgroundColor = UIColor(named: "details")
        mainView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainView)
    }
    func addDetailsView1(){
        detailsView1.backgroundColor = UIColor(named: "Color")
        detailsView1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailsView1)
    }
    func addDetailsView2(){
        detailsView2.backgroundColor = UIColor(named: "Color")
        detailsView2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailsView2)
    }


}
extension DetailsViewController{
    func constraintScrollView(){
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func constraintContentView() {
        contentView.snp.makeConstraints{ make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.safeAreaLayoutGuide)
            make.trailing.equalTo(scrollView.safeAreaLayoutGuide)
            make.width.equalTo(scrollView.snp.width)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.height.equalTo(1200)
        }
    }
    func constraintMainView() {
        mainView.snp.makeConstraints{ make in
            make.top.equalTo(40)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(400)
        }
    }
    func constraintImageBack() {
        imageBack.snp.makeConstraints{ make in
            make.top.equalTo(mainView.snp_topMargin)
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.bottom.equalTo(mainView.snp.bottom)
            make.height.equalTo(mainView.snp.height)
        }
    }
    func constraintDetailsView1() {
        detailsView1.snp.makeConstraints{ make in
            make.top.equalTo(500)
            make.leading.equalTo(mainView.snp.leading)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
    func constraintDetailsView2() {
        detailsView2.snp.makeConstraints{ make in
            make.top.equalTo(500)
            make.trailing.equalTo(mainView.snp.trailing)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

