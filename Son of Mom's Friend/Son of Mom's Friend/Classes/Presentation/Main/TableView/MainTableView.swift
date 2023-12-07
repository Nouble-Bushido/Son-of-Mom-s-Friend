//
//  MainTableView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class MainTableView: UITableView {
    lazy var elements = [MainTableElement]()
    var didSelectItem: ((MainTableElement) -> Void)?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public
extension MainTableView {
    func setup(elements: [MainTableElement]) {
        self.elements = elements
        print("Количество элементов: \(elements.count)")
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension MainTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.Nunito.semiBold(size: 18.scale))
            .lineHeight(22.scale)
            .textAlignment(.center)
            .letterSpacing(-0.41.scale)
        
        switch section {
        case 0: return "Main.FirstSection.Text".localized.attributed(with: attrs).string
        case 1: return "Main.SecondSection.Text".localized.attributed(with: attrs).string
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            let celebrities = elements.compactMap { element -> [Celebrity]? in
                if case .dateBirthday(let celebrities) = element {
                    return celebrities
                }
                return nil
            }
            let todayBirthdays = celebrities.flatMap { $0 }.filter { isCelebrityBirthdayToday(celebrity: $0) }
            return todayBirthdays.count
        case 1:
            let achievements = elements.compactMap { element -> [Achievement]? in
                if case .achievement(let achievements) = element {
                    return achievements
                }
                return nil
            }
            let achievementsInUserAge = achievements.flatMap { $0 }.filter { checkAchievementsInUserAge(achievement: $0) }
            return achievementsInUserAge.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch elements[indexPath.section] {
        case .dateBirthday(let celebrities):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CelebrityBirthdayDateCell.self)) as? CelebrityBirthdayDateCell else { return UITableViewCell()}
            cell.setup(celebrity: celebrities[indexPath.row])
            return cell
        case .achievement(let achievements):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AchievementDetailsCell.self)) as? AchievementDetailsCell else { return UITableViewCell()}
            cell.setup(achievemnt: achievements[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedElement = elements[indexPath.section]
        didSelectItem?(selectedElement)
    }
}

//MARK: UITableViewDelegate
extension MainTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

//MARK: Private
private extension MainTableView {
    func initialize() {
        register(AchievementDetailsCell.self, forCellReuseIdentifier: String(describing: AchievementDetailsCell.self))
        register(CelebrityBirthdayDateCell.self, forCellReuseIdentifier: String(describing: CelebrityBirthdayDateCell.self))
        dataSource = self
        delegate = self
    }
    
    func isCelebrityBirthdayToday(celebrity: Celebrity) -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let celebrityBirthday = calendar.startOfDay(for: celebrity.dateOfBirth)
        return calendar.isDate(today, equalTo: celebrityBirthday, toGranularity: .day)
    }
    
    func checkAchievementsInUserAge(achievement: Achievement) -> Bool {
        let userManager = UserManager()
        guard let user = userManager.getUser() else { return false }
        let calendar = Calendar.current
        let currentDate = Date()
        let userAge = calendar.dateComponents([.year], from: user.dateOfBirth, to: currentDate).year ?? 0
        return userAge == achievement.ageAtAchievement
    }
}
