//
//  Links.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct Links: Codable {
    enum CodingKeys: String, CodingKey {
        case photos
        // case selfKey = "self"
    }

    var photos: String?
    // var selfValue: String?
}
