//
//  MainViewModel.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import Foundation

final class MainViewModel {
    private lazy var celebrityManager = CelebrityManager()
    private lazy var achievementManager = AchievementManager()
    private lazy var userManager = UserManager()
}

extension MainViewModel {
    struct Input {
        let bind: ([MainTableElement]) -> ()
    }
    
    struct Output {
        let didSelect: (MainTableElement) -> ()
    }
    
    func configure(input: Input) -> Output {
        let celebrities = celebrityManager.getCelebrities() 
        let achievements = getAchievements(age: 30, id: 2)
        print("-----\(celebrities)")
        print("-----\(achievements)")
        
        let mainTableElements = createMainTableElements(celebrities: celebrities, achievements: achievements)
        input.bind(mainTableElements)
        return Output(didSelect: { selected in
        })
    }
}

// MARK: Private
private extension MainViewModel {
    func getCelebrities() -> [Celebrity] {
       let celebreties = celebrityManager.getCelebrities()
        print("\(celebreties)")
        return celebreties
    }
    
    func getAchievements(age: Int?, id: Int?) -> [Achievement] {
        achievementManager.getAchievements(age: age, celebrityId: id)
    }
    
    func createMainTableElements(celebrities: [Celebrity], achievements: [Achievement]) -> [MainTableElement] {
        var mainTableElements: [MainTableElement] = []
        
        for celebrity in celebrities {
            mainTableElements.append(.dateBirthday([celebrity]))
        }
        for achievement in achievements {
            mainTableElements.append(.achievement([achievement]))
        }
       return mainTableElements
    }
}
