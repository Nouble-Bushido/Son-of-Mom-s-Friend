//
//  MainViewCountroller.swift
//  Son of Mom's Friend
//
//  Created by Артем Чжен on 21.11.2023.
//

import UIKit

final class MainViewCountroller: UIViewController {
    private lazy var mainView = MainView()
    private lazy var viewModel = MainViewModel()
    private var didSelectElements: ((MainTableElement) -> Void)?
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let celebreties = CelebrityManager()
        let allCelebrities = celebreties.getCelebrities()
        print("Celebrities: \(allCelebrities)")

        
       let output = viewModel.configure(input: MainViewModel.Input(bind: { [weak self] elements in
            self?.mainView.tableView.setup(elements: elements)
        }))
        didSelectElements = output.didSelect
        
        mainView.tableView.didSelectItem = { [weak self] selectedElement in
            self?.didSelectElements?(selectedElement)
        }
    }
}
