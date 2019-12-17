//
//  ProfileImage.swift
//  Pinterest
//
//  Created by Hanan on 12/17/19.
//  Copyright © 2019 HANAN. All rights reserved.
//

import Foundation

struct ProfileImage: Codable {
    enum CodingKeys: String, CodingKey {
        case medium
        case large
        case small
    }

    var medium: String?
    var large: String?
    var small: String?
}
