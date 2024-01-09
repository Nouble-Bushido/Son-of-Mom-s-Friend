//
//  InfoTableView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 06.01.2024.
//

import UIKit

final class InfoTableView: UITableView {
    var pair = [InfoTablePair]()
    var didSelectItem: ((InfoTablePair) -> Void)?
    var selectedCelebrityPair: InfoTablePair?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoTableView {
    func setup(pairs: [InfoTablePair]) {
        self.pair = pairs
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension InfoTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoTableViewCell.self)) as? InfoTableViewCell else { return UITableViewCell() }
        cell.setup(with: pair[indexPath.row])
        return cell
    }
}

