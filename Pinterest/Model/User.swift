//
//  User.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case username
        case id
        case name
        case profileImage = "profile_image"
        case links
    }

    var username: String?
    var id: String?
    var name: String?
    var profileImage: ProfileImage?
    var links: Links?
}
