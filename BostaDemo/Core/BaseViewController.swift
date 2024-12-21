//
//  BaseViewController.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import UIKit
import SwiftUI
import Combine

class BaseViewController<VM: BaseViewModel>: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: VM
    private var cancellables: Set<AnyCancellable> = []
    
    // SwiftUI Loading Indicator
    private var loadingIndicator: UIHostingController<LoadingIndicator>?
    
    // MARK: - Initializer
    
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Setup Bindings
    
    private func setupBindings() {
        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .loading:
                    self?.showLoadingIndicator()
                case .success, .failure:
                    self?.hideLoadingIndicator()
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Loading Indicator Management
    
    private func showLoadingIndicator() {
        guard loadingIndicator == nil else { return }
        
        let hostingController = UIHostingController(rootView: LoadingIndicator())
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear
        view.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingController.view.widthAnchor.constraint(equalToConstant: 100),
            hostingController.view.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        hostingController.didMove(toParent: self)
        loadingIndicator = hostingController
    }
    
    private func hideLoadingIndicator() {
        guard let loadingIndicator = loadingIndicator else { return }
        loadingIndicator.willMove(toParent: nil)
        loadingIndicator.view.removeFromSuperview()
        loadingIndicator.removeFromParent()
        self.loadingIndicator = nil
    }
}
