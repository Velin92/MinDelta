//
//  Coordinator.swift
//  MinDeltaTest
//
//  Created by Mauro Romito on 09/12/2019.
//  Copyright © 2019 Mauro Romito. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class AppCoordinator {
    
    weak var window: UIWindow!
    init(window: UIWindow) {
        self.window = window
    }
    
    private var navigationController: UINavigationController! {
        window.rootViewController as? UINavigationController
    }
    
    func start() {
        let viewModel = MainViewModel()
        viewModel.goToTestClosure = { [weak self] type in
            self?.goToTest(of: type)
        }
        let view = MainView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.isHidden = true
        window.rootViewController = nav
    }
    
    private func goToTest(of type: TestType) {
        let viewModel = TestViewModel(parser: DatParser(), type: type)
        viewModel.backClosure = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        viewModel.parseModels()
        let view = TestView(viewModel: viewModel)
        let controller = UIHostingController(rootView: view)
        navigationController.pushViewController(controller, animated: true)
    }
}
