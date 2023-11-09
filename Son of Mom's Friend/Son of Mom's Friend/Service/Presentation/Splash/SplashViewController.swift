//
//  SplashViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 08.11.2023.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    //MARK: GUI
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Nunito-SemiBold", size: 24)
        label.text = "Здесь тебя ждет сын маминой подруги"
       return label
    }()
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: Methods
    private func setupUI(){
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.backgroundColor = .blue
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(349)
            make.height.equalTo(402)
            make.center.equalToSuperview().offset(-60)
            make.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview().offset(10)
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
    }
}
