//
//  APIService.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine
import CombineMoya
import Moya

class APIService: APIServiceProtocol {
    private let provider: MoyaProvider<APIEndpoints>
    
    init(provider: MoyaProvider<APIEndpoints> = MoyaProvider<APIEndpoints>()) {
        self.provider = provider
    }
    
    func request<T>(with request: APIEndpoints) -> AnyPublisher<T, any Error> where T: Decodable {
        return provider.requestPublisher(request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
