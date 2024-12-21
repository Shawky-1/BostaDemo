//
//  User.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation

/**
 User Model
 # JSON Response: #
 ```
 {
 "id": 1,
 "name": "Leanne Graham",
 "username": "Bret",
 "email": "Sincere@april.biz",
 "address": {
 "street": "Kulas Light",
 "suite": "Apt. 556",
 "city": "Gwenborough",
 "zipcode": "92998-3874",
 "geo": {
 "lat": "-37.3159",
 "lng": "81.1496"
 }
 },
 "phone": "1-770-736-8031 x56442",
 "website": "hildegard.org",
 "company": {
 "name": "Romaguera-Crona",
 "catchPhrase": "Multi-layered client-server neural-net",
 "bs": "harness real-time e-markets"
 }
 }
 ```
 */

struct User: Decodable {
    let id: Int
    let name: String
    let address: String
    
    // Custom decoding to format address into a single string
    private enum CodingKeys: String, CodingKey {
        case id, name, addressDetails = "address"
    }
    
    private enum AddressKeys: String, CodingKey {
        case street, suite, city, zipcode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        // Decode the nested address and format it
        let addressContainer = try container.nestedContainer(keyedBy: AddressKeys.self, forKey: .addressDetails)
        let street = try addressContainer.decode(String.self, forKey: .street)
        let suite = try addressContainer.decode(String.self, forKey: .suite)
        let city = try addressContainer.decode(String.self, forKey: .city)
        let zipcode = try addressContainer.decode(String.self, forKey: .zipcode)
        
        address = "\(street), \(suite), \(city), \(zipcode)"
    }
}
