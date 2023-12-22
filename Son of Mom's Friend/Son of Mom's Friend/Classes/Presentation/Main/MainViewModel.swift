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
        let bind: ([MainTableSection]) -> ()
    }
    
    struct Output {
        let didSelect: (MainTableElement) -> ()
    }
    
    func configure(input: Input) -> Output {
        let celebrities = celebrityManager.getCelebrities()
        let achievements = achievementManager.getAchievements()
        
        let todayBirthdays = celebrities.compactMap { $0 }.filter { isCelebrityBirthdayToday(celebrity: $0) }
        let achievementsInUserAge = achievements.compactMap { $0 }.filter { checkAchievementsInUserAge(achievement: $0)}
        
        let celebritySection = MainTableSection(title: "Main.FirstSection.Text".localized, elements: todayBirthdays.map { .dateBirthday($0) })
        let achievementSection = MainTableSection(title: "Main.SecondSection.Text".localized, elements: achievementsInUserAge.map { .achievement($0) })
        
        let sections: [MainTableSection] = [celebritySection, achievementSection]
        input.bind(sections)
        
        return Output(didSelect: { selected in
        })
    }
    
    func gateCelebrity(for celebrityId: Int) -> Celebrity? {
        return celebrityManager.getCelebrities().first { $0.id == celebrityId }
    }
}

// MARK: Private
private extension MainViewModel {
    func createMainTableElements(celebrities: [Celebrity], achievements: [Achievement]) -> [MainTableElement] {
        var mainTableElements: [MainTableElement] = []
        
        for celebrity in celebrities {
            mainTableElements.append(.dateBirthday(celebrity))
        }
        for achievement in achievements {
            mainTableElements.append(.achievement(achievement))
        }
       return mainTableElements
    }
    
    func isCelebrityBirthdayToday(celebrity: Celebrity) -> Bool {
        let calendar = Calendar.current
        let todayComponets = calendar.dateComponents([.day,.month], from: Date())
        let celebrityBirthdayComponents = calendar.dateComponents([.day, .month], from: celebrity.dateOfBirth)
        return celebrityBirthdayComponents.day == todayComponets.day &&
               celebrityBirthdayComponents.month == todayComponets.month
    }
    
    func checkAchievementsInUserAge(achievement: Achievement) -> Bool {
        guard let user = userManager.getUser() else { return false }
        let calendar = Calendar.current
        let currentDate = Date()
        let userAge = calendar.dateComponents([.year], from: user.dateOfBirth, to: currentDate).year ?? 0
        return userAge == achievement.ageAtAchievement
    }
    
    func findCelebrityAndAchievementPair(achievementID: Int, celebrities: [Celebrity], achievements: [Achievement]) -> (Celebrity, Achievement)? {
        for achievement in achievements {
            if achievement.id == achievementID {
                if let celebrity = celebrities.first(where: { $0.id == achievement.celebrityId }) {
                    return (celebrity, achievement)
                }
            }
        }
        return nil
    }
}
