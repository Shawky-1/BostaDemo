//
//  APIServiceProtocol.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func request<T>(with request: APIEndpoints) -> AnyPublisher<T, any Error> where T: Decodable}
