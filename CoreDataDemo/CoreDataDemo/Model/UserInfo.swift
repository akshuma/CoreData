//
//  UserInfo.swift
//  CoreDataDemo
//
//  Created by Akshu on 20/11/19.
//  Copyright © 2019 Akshu. All rights reserved.
//

import UIKit

struct UserInfoData: Codable {
    var UserInfo : [UserInfoElement]?
}
struct UserInfoElement: Codable {
    var userID, id: Int?
    var title: String?
    var completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

