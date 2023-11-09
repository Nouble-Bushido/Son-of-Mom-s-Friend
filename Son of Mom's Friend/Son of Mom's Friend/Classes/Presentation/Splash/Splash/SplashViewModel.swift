//
//  SplashViewModel.swift
//  Son of Mom's Friend
//
//  Created by Андрей Чернышев on 09.11.2023.
//

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
    
    func configure(input: Input) {
        input.route(makeRoute())
    }
}

// MARK: Private
private extension SplashViewModel {
    func makeRoute() -> Route {
        userManager.getUser()?.dateOfBirth == nil ? Route.requestBirthdate : Route.main
    }
}
