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
        actionSettingButon()
      
        let output = viewModel.configure(input: MainViewModel.Input(route: { [weak self] route in
            switch route {
            case .info(let celebrity):
                let vc = InfoViewCountroller(celebrity: celebrity)
                self?.navigationController?.pushViewController(vc, animated: true)
                }
            }, bind: { [weak self] sections in
                self?.mainView.tableView.setup(sections: sections)
            }))
        
        didSelectElements = output.didSelect
        
        mainView.tableView.didSelectItem = { [weak self] selectedElement in
            self?.didSelectElements?(selectedElement)
        }
    }
}

private extension MainViewCountroller {
    func actionSettingButon() {
        mainView.settingButton.addTarget(self, action: #selector(pressSettingButon), for: .touchUpInside)
    }
    
    @objc func pressSettingButon() {
        //TODO: go to settingView
    }
}

