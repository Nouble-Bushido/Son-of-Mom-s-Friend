//
//  MainTableView.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 05.12.2023.
//

import UIKit

final class MainTableView: UITableView {
    lazy var elements = [MainTableElement]()
    
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
        
        reloadData()
    }
}

//MARK: UITableViewDataSourse
extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch elements[indexPath.row] {
        case .text(let text):
            let cell = dequeueReusableCell(withIdentifier: String(describing: MainTableTextCell.self)) as! MainTableTextCell
            cell.setup(text: text)
            return cell
        case .author(let author):
            let cell = dequeueReusableCell(withIdentifier: String(describing: MainTableAuthorCell.self)) as! MainTableAuthorCell
            cell.setup(author: author)
            return cell
        }
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
           register(MainTableTextCell.self, forCellReuseIdentifier: String(describing: MainTableTextCell.self))
           register(MainTableAuthorCell.self, forCellReuseIdentifier: String(describing: MainTableAuthorCell.self))
           
           dataSource = self
           delegate = self
       }
}
