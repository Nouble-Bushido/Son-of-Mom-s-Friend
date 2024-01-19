//
//  InfoTableView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 06.01.2024.
//

import UIKit

final class InfoTableView: UITableView {
    var didSelectItem: ((InfoTableElement) -> Void)?
    lazy var elements = [InfoTableElement]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableView {
    func setup(elements: [InfoTableElement]) {    
        self.elements = elements
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension InfoTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch elements[indexPath.row] {
        case .celebrityInfo(let celebrity):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CelebrityInfoCell.self)) as? CelebrityInfoCell else { return UITableViewCell()}
            cell.setup(celebrity: celebrity)
            return cell
        case .info(let text, .biography):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoNameCell.self)) as? InfoNameCell else { return UITableViewCell()}
            cell.setup(text: text)
            return cell
        case .biographyInfo(let celebrity):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BiographyInfoCell.self)) as? BiographyInfoCell else { return UITableViewCell()}
            cell.setup(celebrity: celebrity)
            return cell
        case .info(let text, .achievement):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoNameCell.self)) as? InfoNameCell else { return UITableViewCell()}
            cell.setup(text: text)
            return cell
        case .achievementInfo(let celebrity, let achievement):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AchievemtInfoCell.self)) as? AchievemtInfoCell else { return UITableViewCell()}
            cell.setup(celebrity: celebrity, achievement: achievement)
            return cell
        }
    }
}

//MARK: UITableViewDelegate
extension InfoTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: Private
private extension InfoTableView {
    func initialize() {
        register(CelebrityInfoCell.self, forCellReuseIdentifier: String(describing: CelebrityInfoCell.self))
        register(InfoNameCell.self, forCellReuseIdentifier: String(describing: InfoNameCell.self))
        register(BiographyInfoCell.self, forCellReuseIdentifier: String(describing: BiographyInfoCell.self))
        register(AchievemtInfoCell.self, forCellReuseIdentifier: String(describing: AchievemtInfoCell.self))
        dataSource = self
        delegate = self
        separatorStyle = .none
    }
}
