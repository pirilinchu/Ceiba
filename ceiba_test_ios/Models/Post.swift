//
//  Post.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import Foundation
import RealmSwift

// MARK: - Post
class Post: Object, Codable {
    @objc dynamic var userID: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

typealias PostsResponse = [Post]
