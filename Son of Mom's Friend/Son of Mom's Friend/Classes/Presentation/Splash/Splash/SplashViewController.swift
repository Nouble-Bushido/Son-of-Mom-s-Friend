//
//  SplashViewController.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 08.11.2023.
//

import UIKit

final class SplashViewController: UIViewController {
    lazy var mainView = SplashView()
    
    private lazy var viewModel = SplashViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.configure(input: SplashViewModel.Input(
            route: route
        ))
    }
}

// MARK: Public
extension SplashViewController {
    static func make() -> SplashViewController {
        let vc = SplashViewController()
        vc.navigationItem.backButtonTitle = " "
        return vc
    }
}

// MARK: Private
private extension SplashViewController {
    var route: (SplashViewModel.Route) -> Void {
        { route in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                switch route {
                case .requestBirthdate:
                    break // TODO: open vc with dialog
                case .main:
                    break // TODO: set main controller as root
                }
            }
        }
    }
}
