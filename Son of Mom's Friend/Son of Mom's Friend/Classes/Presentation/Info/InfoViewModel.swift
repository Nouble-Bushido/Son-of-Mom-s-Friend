//
//  InfoViewModel.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 04.01.2024.
//

final class InfoViewModel {
    private let achievementManager = AchievementManager()
    private let celebrity: Celebrity
 
    init(celebrity: Celebrity) {
        self.celebrity = celebrity
    }
}

extension InfoViewModel {
    struct Input {
        let bind: ([InfoTableElement]) -> ()
    }
    
    struct Output {
        let didSelect: (InfoTableElement) -> ()
    }
    
    func configure(input: Input) -> Output {
        let сelebrityInfo = InfoTableElement.celebrityInfo(celebrity)
        let biographyName = InfoTableElement.biographyName("Info.Biography.Text".localized)
        let biographyInfo = InfoTableElement.biographyInfo(celebrity)
        let achievementName = InfoTableElement.achievemntName("Info.Achievement.Text".localized)
        let achievements = getAchievements(forCelebrityId: celebrity.id)
        var elements: [InfoTableElement] = [сelebrityInfo, biographyName, biographyInfo, achievementName]
        
        for achievement in achievements {
             let achievementInfo = InfoTableElement.achievementInfo(celebrity, achievement)
             elements.append(achievementInfo)
         }
        
        input.bind(elements)
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
