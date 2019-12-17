//
//  Urls.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct Urls: Codable {
    enum CodingKeys: String, CodingKey {
        case small
        case regular
        case raw
        case full
        case thumb
    }

    var small: String?
    var regular: String?
    var raw: String?
    var full: String?
    var thumb: String?
}
