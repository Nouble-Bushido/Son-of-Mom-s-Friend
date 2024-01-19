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
    private var didSelectElements: ((InfoTableElement) -> Void)?
    
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
        
        let output = viewModel.configure(input: InfoViewModel.Input(bind: { [weak self] elements in
            self?.infoView.tableView.setup(elements: elements)
        }))
        
        didSelectElements = output.didSelect
        
        infoView.tableView.didSelectItem = { [weak self] selectedElement in
            self?.didSelectElements?(selectedElement)
        }
    }
}
