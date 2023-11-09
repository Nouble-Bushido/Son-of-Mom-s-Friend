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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkBirhday()
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
            make.leading.trailing.equalToSuperview().inset(40)
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
    }
    
    private func checkBirhday() {
        if UserManager.getUserBirthday() == nil {
            showBirthdayAlert()
        } else {
            navigateToMainScreen()
        }
    }
    
    private func showBirthdayAlert() {
        let ac = UIAlertController(title: "Введите дату рождения", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
            self?.navigateToMainScreen()}
        
        ac.addTextField { textField in
            textField.placeholder = "ДД.ММ.ГГГГ"
        }
        
        ac.addAction(okAction)
        present(ac, animated: true)
    }
    
    private func navigateToMainScreen() {
        let mainScreen = ViewController()
        present(mainScreen, animated: true)
    }
}
