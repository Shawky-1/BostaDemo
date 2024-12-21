//
//  Album.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation

/**
 Album Model
 # JSON Response: #
 ```
 {
 "userId": 1,
 "id": 1,
 "title": "quidem molestiae enim"
 }
 ```
 */

struct Album: Decodable {
    let id: Int
    let title: String
}
