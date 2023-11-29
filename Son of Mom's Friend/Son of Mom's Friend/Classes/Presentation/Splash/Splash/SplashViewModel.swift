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
    var output: Output?
    var input: Input?
    private lazy var userManager = UserManager()
}

// MARK: Public
extension SplashViewModel {
    struct Input {
        let route: (Route) -> Void
    }
    
    func configure(input: Input) {
        input.route(makeRoute())
    }
}

extension SplashViewModel {
    struct Output {
        var userDidSelectDate: (Date) -> Void
    }
    
    func configure(output: Output) {
        self.output = output
    }
    
    func userDidSelectDate(_ date: Date) {
        let user = User(dateOfBirth: date)
        userManager.set(user: user)
        input?.route(.main)
    }
}

// MARK: Private
private extension SplashViewModel {
    func makeRoute() -> Route {
        userManager.getUser()?.dateOfBirth == nil ? Route.requestBirthdate : Route.main
    }
}
