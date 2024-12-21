//
//  APIService.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

class APIService: APIServiceProtocol {
        
    func request<T>(with request: URLRequest) -> AnyPublisher<T, any Error> where T: Decodable {
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    
}
