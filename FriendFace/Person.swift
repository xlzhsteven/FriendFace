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
    let isActive: Bool? = nil
    let age: Int? = nil
    let company: String? = nil
    let email: String? = nil
    let address: String? = nil
    let about: String? = nil
    let registered: Date? = nil
    let tags: [String]? = nil
    let friends: [Person]? = nil
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
