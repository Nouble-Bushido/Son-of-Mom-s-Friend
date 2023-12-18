//
//  SplashViewModel.swift
//  Son of Mom's Friend
//
//  Created by Андрей Чернышев on 09.11.2023.
//
import UIKit

final class SplashViewModel {
    enum Route {
        case requestBirthdate, main
    }
    private lazy var userManager = UserManager()
}

// MARK: Public
extension SplashViewModel {
    struct Input {
        let route: (Route) -> Void
    }
    
    func configure(input: Input) -> Output {
        input.route(makeRoute())
        var userDidSelectDate: (Date) -> Void {
            { [weak self] date in
                let user = User(dateOfBirth: date)
                self?.userManager.set(user: user)
                input.route(.main)
            }
        }
        
        return  Output(userDidSelectDate: userDidSelectDate)
    }
}

extension SplashViewModel {
    struct Output {
        var userDidSelectDate: (Date) -> Void
    }
}

// MARK: Private
private extension SplashViewModel {
    func makeRoute() -> Route {
        userManager.getUser()?.dateOfBirth == nil ? Route.requestBirthdate : Route.main
    }
}
