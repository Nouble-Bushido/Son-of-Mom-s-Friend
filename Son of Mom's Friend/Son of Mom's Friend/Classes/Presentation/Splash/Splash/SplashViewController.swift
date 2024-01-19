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
    private var userDidSelectDate: ((Date) -> Void)?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let output = viewModel.configure(input: SplashViewModel.Input(
            route: route
        ))
        userDidSelectDate = output.userDidSelectDate
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let self = self else { return }
                switch route {
                case .requestBirthdate:
                    self.presentBirthdayRequest()
                case .main:
                    self.presentMain()
                }
            }
        }
    }
    
    func presentBirthdayRequest() {
        let vc = BirthdateRequestViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.onContinue = { [weak self] date in
            self?.userDidSelectDate?(date)
        }
        present(vc, animated: true)
    }
    
    func presentMain() {
        let vc = MainViewCountroller()
        let navig = UINavigationController(rootViewController: vc)
        vc.modalPresentationStyle = .overFullScreen
        UIApplication.shared.keyWindow?.rootViewController = navig
    }
}
