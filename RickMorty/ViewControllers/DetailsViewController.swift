//
//  DetailsViewController.swift
//  RickMorty
//
//  Created by Maksym on 12.11.2023.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    // details info
    var selectedLabel: String?
    var selectedStatus: String?
    var selectedGender: String?
    var selectedType: String?
    var selectedSpecies: String?
    
    var category = ["Status", "Gender", "Type", "Species"]
    
    //main image person
    var mainImage: String!
    
    //contentview and scroll
    var contentView = UIView()
    var scrollView = UIScrollView()
    var mainView = UIView()
    var imageBack = UIImageView()
    
    //detailsview
    var detailsView1 = UIView()
    var detailsView2 = UIView()
    var detailsView3 = UIView()
    var detailsView4 = UIView()
    
    //textLabel
    var status = UILabel()
    var gender = UILabel()
    var type = UILabel()
    var species = UILabel()
    
    var labelCat1 = UILabel()
    var labelCat2 = UILabel()
    var labelCat3 = UILabel()
    var labelCat4 = UILabel()
    
    var lightView1 = UIView()
    var lightView2 = UIView()
    var lightView3 = UIView()
    var lightView4 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedLabel
        view.backgroundColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButton))
        
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
        
        addDetailsView3()
        addDetailsView4()
        constraintDetailsView3()
        constraintDetailsView4()
        
        addStatus()
        constraintStatus()
        addGender()
        constraintGender()
        addType()
        constraintType()
        addSpecies()
        constraintSpecies()
        
        
     
        
        addlightView()
        constraintLightView1()
        constraintLightView2()
        constraintLightView3()
        constraintLightView4()
        
        addCat()
        constraintCategory()
        

    }
    @objc func shareButton(){
        
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
        detailsView1.layer.cornerRadius = 20
        detailsView1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailsView1)
    }
    func addDetailsView2(){
        detailsView2.backgroundColor = UIColor(named: "Color")
        detailsView2.layer.cornerRadius = 20
        detailsView2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailsView2)
    }
    func addDetailsView3(){
        detailsView3.backgroundColor = UIColor(named: "Color")
        detailsView3.layer.cornerRadius = 20
        detailsView3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailsView3)
    }
    func addDetailsView4(){
        detailsView4.backgroundColor = UIColor(named: "Color")
        detailsView4.layer.cornerRadius = 20
        detailsView4.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(detailsView4)
    }
    func addStatus(){
        status.text = selectedStatus
        status.textColor = .blue
        status.translatesAutoresizingMaskIntoConstraints = false
        detailsView1.addSubview(status)
    }
    func addGender(){
        gender.text = selectedGender
        gender.textColor = .purple
        gender.translatesAutoresizingMaskIntoConstraints = false
        detailsView2.addSubview(gender)
    }
    func addType(){
        if type.text == nil{
            type.text = "none"
        }else{
            type.text = selectedType
            
        }
        type.textColor = .red
        type.translatesAutoresizingMaskIntoConstraints = false
        detailsView3.addSubview(type)
    }
    func addSpecies(){
        species.text = selectedSpecies
        species.textColor = .green
        species.translatesAutoresizingMaskIntoConstraints = false
        detailsView4.addSubview(species)
    }
    func addCat(){
        labelCat1.text = category[0]
        labelCat1.textColor = .lightGray
        labelCat1.font = UIFont.boldSystemFont(ofSize: 20)
        labelCat1.translatesAutoresizingMaskIntoConstraints = false
        
        labelCat2.text = category[1]
        labelCat2.textColor = .lightGray
        labelCat2.font = UIFont.boldSystemFont(ofSize: 20)
        labelCat2.translatesAutoresizingMaskIntoConstraints = false
        
        labelCat3.text = category[2]
        labelCat3.textColor = .lightGray
        labelCat3.font = UIFont.boldSystemFont(ofSize: 20)
        labelCat3.translatesAutoresizingMaskIntoConstraints = false
        
        labelCat4.text = category[3]
        labelCat4.textColor = .lightGray
        labelCat4.font = UIFont.boldSystemFont(ofSize: 20)
        labelCat4.translatesAutoresizingMaskIntoConstraints = false

        detailsView1.addSubview(labelCat1)
        detailsView2.addSubview(labelCat2)
        detailsView3.addSubview(labelCat3)
        detailsView4.addSubview(labelCat4)
    }
    func addlightView(){
        lightView1.backgroundColor = UIColor(named: "backView")
        lightView1.translatesAutoresizingMaskIntoConstraints = false
        lightView1.layer.cornerRadius = 20
        detailsView1.addSubview(lightView1)
        
        lightView2.backgroundColor = UIColor(named: "backView")
        lightView2.translatesAutoresizingMaskIntoConstraints = false
        lightView2.layer.cornerRadius = 20
        detailsView2.addSubview(lightView2)
        
        lightView3.backgroundColor = UIColor(named: "backView")
        lightView3.translatesAutoresizingMaskIntoConstraints = false
        lightView3.layer.cornerRadius = 20
        detailsView3.addSubview(lightView3)
        
        lightView4.backgroundColor = UIColor(named: "backView")
        lightView4.translatesAutoresizingMaskIntoConstraints = false
        lightView4.layer.cornerRadius = 20
        detailsView4.addSubview(lightView4)
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
            make.top.equalTo(0)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(400)
        }
    }
    func constraintImageBack() {
        imageBack.snp.makeConstraints{ make in
            make.top.equalTo(mainView.snp.topMargin)
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.bottom.equalTo(mainView.snp.bottom)
            make.height.equalTo(mainView.snp.height)
        }
    }
    func constraintDetailsView1() {
        detailsView1.snp.makeConstraints{ make in
            make.top.equalTo(410)
            make.leading.equalTo(mainView.snp.leading)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
    }
    func constraintDetailsView2() {
        detailsView2.snp.makeConstraints{ make in
            make.top.equalTo(410)
            make.trailing.equalTo(mainView.snp.trailing)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
    }
    func constraintDetailsView3() {
        detailsView3.snp.makeConstraints{ make in
            make.top.equalTo(570)
            make.leading.equalTo(mainView.snp.leading)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
    }
    func constraintDetailsView4() {
        detailsView4.snp.makeConstraints{ make in
            make.top.equalTo(570)
            make.trailing.equalTo(mainView.snp.trailing)
            make.width.equalTo(200)
            make.height.equalTo(150)
        }
    }
    func constraintStatus() {
        status.snp.makeConstraints{ make in
            make.centerX.equalTo(detailsView1.snp.centerX)
            make.centerY.equalTo(detailsView1.snp.centerY)
            make.height.equalTo(50)
        }
    }
    func constraintGender() {
        gender.snp.makeConstraints{ make in
            make.centerX.equalTo(detailsView2.snp.centerX)
            make.centerY.equalTo(detailsView2.snp.centerY)
            make.height.equalTo(50)
        }
    }
    func constraintType() {
        type.snp.makeConstraints{ make in
            make.centerX.equalTo(detailsView3.snp.centerX)
            make.centerY.equalTo(detailsView3.snp.centerY)
            make.height.equalTo(50)
        }
    }
    func constraintSpecies() {
        species.snp.makeConstraints{ make in
            make.centerX.equalTo(detailsView4.snp.centerX)
            make.centerY.equalTo(detailsView4.snp.centerY)
            make.height.equalTo(50)
        }
    }
    func constraintLightView1() {
        lightView1.snp.makeConstraints{ make in
            make.top.equalTo(detailsView1.snp.top)
            make.trailing.equalTo(detailsView1.snp.trailing)
            make.leading.equalTo(detailsView1.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    func constraintLightView2() {
        lightView2.snp.makeConstraints{ make in
            make.top.equalTo(detailsView2.snp.top)
            make.trailing.equalTo(detailsView2.snp.trailing)
            make.leading.equalTo(detailsView2.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    func constraintLightView3() {
        lightView3.snp.makeConstraints{ make in
            make.top.equalTo(detailsView3.snp.top)
            make.trailing.equalTo(detailsView3.snp.trailing)
            make.leading.equalTo(detailsView3.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    func constraintLightView4() {
        lightView4.snp.makeConstraints{ make in
            make.top.equalTo(detailsView4.snp.top)
            make.trailing.equalTo(detailsView4.snp.trailing)
            make.leading.equalTo(detailsView4.snp.leading)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    func constraintCategory() {
        labelCat1.snp.makeConstraints{ make in
            make.centerY.equalTo(lightView1.snp.centerY)
            make.centerX.equalTo(lightView1.snp.centerX)
            make.height.equalTo(50)
        }
        
        labelCat2.snp.makeConstraints{ make in
            make.centerY.equalTo(lightView2.snp.centerY)
            make.centerX.equalTo(lightView2.snp.centerX)
            make.height.equalTo(50)
        }
        labelCat3.snp.makeConstraints{ make in
            make.centerY.equalTo(lightView3.snp.centerY)
            make.centerX.equalTo(lightView3.snp.centerX)
            make.height.equalTo(50)
        }
        labelCat4.snp.makeConstraints{ make in
            make.centerY.equalTo(lightView4.snp.centerY)
            make.centerX.equalTo(lightView4.snp.centerX)
            make.height.equalTo(50)
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

