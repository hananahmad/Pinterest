//
//  Categories.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct Categories: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case id
        case photoCount = "photo_count"
        case links
    }

    var title: String?
    var id: Int?
    var photoCount: Int?
    var links: Links?
}
