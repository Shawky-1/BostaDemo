//
//  BaseViewModel.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine


protocol BaseViewModelType: AnyObject {
    var cancellables: Set<AnyCancellable> { get }
    var state: ViewModelState { get }
}

enum ViewModelState: Equatable {
    case loading
    case success
    case failure(String)
}

class BaseViewModel: BaseViewModelType {
    var cancellables: Set<AnyCancellable> = []
    @Published var state: ViewModelState = .loading
    
    func clearSubscriptions() {
        cancellables.removeAll()
    }
    
    deinit {
        clearSubscriptions()
    }


}
