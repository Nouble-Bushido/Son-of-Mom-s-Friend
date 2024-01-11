//
//  InfoViewCountroller.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 27.12.2023.
//

import UIKit

final class InfoViewCountroller: UIViewController {
    private lazy var infoView = InfoView()
    private var viewModel: InfoViewModel
    private var didSelectElements: ((InfoTablePair) -> Void)?
    
    init(celebrity: Celebrity) {
        self.viewModel = InfoViewModel(celebrity: celebrity)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = infoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let output = viewModel.configure(input: InfoViewModel.Input(bind: { [weak self] pairs in
            self?.infoView.tableView.setup(pairs: pairs)
        }))
        
        didSelectElements = output.didSelect
        
        infoView.tableView.didSelectItem = { [weak self] selectedElement in
            self?.didSelectElements?(selectedElement)
        }
    }
}

//MARK: SetupView
private extension InfoViewCountroller {
//    func setupInfoView() {
//        guard let infoElement = viewModel.infoFromMainTableView else {
//            return
//        }
//        
//        switch infoElement {
//        case .celebrityAndAchievementPair(let pair):
//            setupInfoView(with: pair)
//        case .celebrity(_):
//            print()
//        }
//    }
//    
//    func setupInfoView(with pair: PairCelebrityAndAchievement) {
//        loadImage(from: pair.celebrity.photoURL)
//        infoView.bioghraphyLabel.text = "Info.Biography.Text".localized
//        let formaterDate = formattedDate(pair.celebrity.dateOfBirth)
//        infoView.birthdayLabel.text = formaterDate
//        infoView.infoBiographyLabel.text = pair.celebrity.biography
//        infoView.achievemetnLabel.text = "Info.Achievement.Text".localized
//        infoView.nameLabel.text = pair.celebrity.name
//    }
//    
//    func loadImage(from urlString: String) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            
//            DispatchQueue.main.async { [weak self] in
//                self?.infoView.photoImage.image = UIImage(data: data)
//            }
//        }.resume()
//    }
//    
//    func formattedDate(_ date: Date) -> String {
//        let dateFormater = DateFormatter()
//        dateFormater.dateFormat = "dd.MM.yyyy"
//        let stringDate = dateFormater.string(from: date)
//        return stringDate
//    }
}
