//
//  APIServiceProtocol.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func request<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, Error>
}
