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
        let achievements = achievementManager.getAchievements()
//        print("-----\(celebrities)")
//        print("-----\(achievements)")
        let mainTableElements = createMainTableElements(celebrities: celebrities, achievements: achievements)
        input.bind(mainTableElements)
        return Output(didSelect: { selected in
        })
    }
}

// MARK: Private
private extension MainViewModel {
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
