//
//  MainTableView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class MainTableView: UITableView {
    lazy var sections = [MainTableSection]()
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
    func setup(sections: [MainTableSection]) {
        self.sections = sections
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension MainTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = Fonts.Nunito.semiBold(size: 18.scale)
        label.textAlignment = .center
        label.text = sections[section].title
        let labelSize = label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        label.frame = CGRect(x: 5, y: -5, width: labelSize.width, height: labelSize.height)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].elements[indexPath.row] {
        case .celebrity(let celebrity):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CelebrityBirthdayDateCell.self)) as? CelebrityBirthdayDateCell else { return UITableViewCell()}
            cell.setup(celebrity: celebrity)
            return cell
        case .celebrityAndAchievementPair(let pair):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AchievementDetailsCell.self)) as? AchievementDetailsCell else { return UITableViewCell()}
            let celebrity = pair.celebrity
            let achievement = pair.achievement
            cell.setup(achievemnt: achievement, celebrity: celebrity)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedElement = sections[indexPath.section].elements[indexPath.row]
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
        separatorStyle = .none
    }
}
