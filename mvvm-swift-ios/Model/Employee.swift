//
//  Employee.swift
//  mvvm-swift-ios
//
//  Created by Hantash on 16/12/2021.
//

import Foundation

struct Employee: Decodable {
    var id: Int
    var name: String
    var userName: String
    var email: String
    var phone: String
    var website: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userName = "username"
        case email
        case phone
        case website
    }
}
