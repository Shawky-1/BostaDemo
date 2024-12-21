//
//  RequestBuilder.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation

struct RequestBuilder {
    
    static func buildRequest(baseURL: String,
                             path: String,
                             parameters: [String: String]? = nil,
                             headers: [String: String]? = nil,
                             method: String = "GET",
                             body: [String: Any?]? = nil) -> URLRequest? {
        
        //MARK: - path Setup
        guard var urlBuilder = URLComponents(string: baseURL) else { return nil }
        urlBuilder.path = path
        
        //MARK: - Parameters Setup
        if let parameters {
            urlBuilder.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        //MARK: - Request Setup
        guard let url = urlBuilder.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        //MARK: - Headers setup
        var requestHeaders: [String: String] = [
            "Accept": "application/json"
            
        ]
        
        if let headers {
            requestHeaders.merge(headers) { (_, new) in new }
        }
        
        requestHeaders.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        //MARK: - Body Setup
        if let body = body, (method == "POST" || method == "PUT" || method == "PATCH") {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = jsonData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                print("Error serializing JSON body: \(error)")
                return nil
            }
        }

        
        return request
    }
}
