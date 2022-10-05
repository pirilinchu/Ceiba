//
//  User.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import Foundation
import RealmSwift

// MARK: - User
class User: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

typealias UsersResponse = [User]
