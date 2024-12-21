//
//  Photo.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation

/**
 Photo Model
 # JSON Response: #
 ```
 {
 "albumId": 1,
 "id": 1,
 "title": "accusamus beatae ad facilis cum similique qui sunt",
 "url": "https://via.placeholder.com/600/92c952",
 "thumbnailUrl": "https://via.placeholder.com/150/92c952"
 }
 ```
 */

struct Photo: Decodable {
    let id: Int
    let title: String
    let url: URL
}
