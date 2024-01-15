//
//  MainViewModel.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import Foundation

final class MainViewModel {
    enum Route {
        case info(Celebrity)
    }
    private lazy var celebrityManager = CelebrityManager()
    private lazy var achievementManager = AchievementManager()
    private lazy var userManager = UserManager()
}

extension MainViewModel {
    struct Input {
        let route: (Route) -> Void
        let bind: ([MainTableSection]) -> ()
    }
    
    struct Output {
        let didSelect: (MainTableElement) -> ()
    }
    
    func configure(input: Input) -> Output {
        let celebrities = celebrityManager.getCelebrities()
        let achievements = achievementManager.getAchievements()
        var celebrityAchievementPairs: [PairCelebrityAndAchievement] = []
        
        let todayBirthdays = celebrities.compactMap { $0 }.filter { isCelebrityBirthdayToday(celebrity: $0) }
        let achievementsInUserAge = achievements.compactMap { $0 }.filter { checkAchievementsInUserAge(achievement: $0)}
        
        for achievement in achievementsInUserAge {
            if let (celebrity, _) = findCelebrityAndAchievementPair(achievementID: achievement.id, celebrities: celebrities, achievements: achievementsInUserAge) {
                let pair = PairCelebrityAndAchievement(celebrity: celebrity, achievement: achievement)
                celebrityAchievementPairs.append(pair)
            }
        }
        
        let celebritySection = MainTableSection(title: "Main.FirstSection.Text".localized, elements: todayBirthdays.map { .celebrity($0) })
        let pairsSection = MainTableSection(title: "Main.SecondSection.Text".localized, elements: celebrityAchievementPairs.map { .celebrityAndAchievementPair($0) })
        
        let sections: [MainTableSection] = [celebritySection, pairsSection]
        input.bind(sections)
        return Output(didSelect: { [weak self] selected in
            guard case let .celebrity(celebrity) = selected else { return }
            input.route(.info(celebrity))
        })
    }
}

// MARK: Private
private extension MainViewModel {
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
