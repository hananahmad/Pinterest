//
//  BaseDO.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct BaseDO: Codable {
    enum CodingKeys: String, CodingKey {
        case urls
        case width
        case likedByUser = "liked_by_user"
        case height
        case id
        case links
        case createdAt = "created_at"
        case likes
        case color
        case user
        case categories
    }

    var urls: Urls?
    var width: Int?
    var likedByUser: Bool?
    var height: Int?
    var id: String?
    var links: Links?
    var createdAt: String?
    var likes: Int?
    var color: String?
    var user: User?
    var categories: [Categories]?
}

