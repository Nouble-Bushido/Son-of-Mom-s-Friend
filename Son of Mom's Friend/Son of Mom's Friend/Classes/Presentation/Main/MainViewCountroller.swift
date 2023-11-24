//
//  MainViewCountroller.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 21.11.2023.
//

import UIKit

final class MainViewCountroller: UIViewController {
    private lazy var mainView = MainView()
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
}
