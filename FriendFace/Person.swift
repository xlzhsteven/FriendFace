//
//  Person.swift
//  FriendFace
//
//  Created by Xiaolong Zhang on 8/24/20.
//  Copyright © 2020 Xiaolong. All rights reserved.
//

import Foundation

struct Person: Codable {
    let id: String
    let name: String
    let isActive: Bool?
    let age: Int?
    let company: String?
    let email: String?
    let address: String?
    let about: String?
    let registered: Date?
    let tags: [String]?
    let friends: [Person]?
}
