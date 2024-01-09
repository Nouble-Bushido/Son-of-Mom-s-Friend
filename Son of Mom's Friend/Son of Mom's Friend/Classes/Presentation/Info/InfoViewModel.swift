//
//  InfoViewModel.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 04.01.2024.
//

final class InfoViewModel {
    private lazy var achievementManager = AchievementManager()
    var infoFromMainTableView: MainTableElement?
}

extension InfoViewModel {
    struct Input {
        let bind: ([InfoTablePair]) -> ()
    }
    
    struct Output {
        let didSelect: (InfoTablePair) -> ()
    }
    
    func configure(input: Input) -> Output {
//        var pair: [InfoTablePair] = []
     
//        input.bind(pair)
        return Output { selected in
        }
    }
}

private extension InfoViewModel {
    func getAchievements(forCelebrityId celebrityID: Int) -> [Achievement] {
        let allAchievements = achievementManager.getAchievements()
        let filteredAchievements = allAchievements.filter { $0.celebrityId == celebrityID }
        return filteredAchievements
    }
}
