//
//  UsersManager.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import Foundation

class UsersManager {
    static let shared = UsersManager()
    
    let database = DBManager.shared
    let api = APIManager.shared
    
    var getUsers: [User] {
        database.users
    }
    
    func getUsers(success: @escaping(_ posts: [User]) -> Void, failure: @escaping(_ error: Error?) -> Void) {
        guard ReachabilityManager.shared.isNetworkReachable else {
            success(database.users)
            return
        }
        
        api.getUsers { users in
            self.database.saveUsers(users: users)
            success(users)
        } failure: { error in
            failure(error)
        }
    }

    func getPostsForUser(user: User, success: @escaping(_ posts: [Post]) -> Void, failure: @escaping(_ error: Error?) -> Void) {
        guard ReachabilityManager.shared.isNetworkReachable else {
            success(database.getPostsFor(user: user))
            return
        }
        
        api.getPosts { posts in
            self.database.savePosts(posts: posts)
            success(self.database.getPostsFor(user: user, posts: posts))
        } failure: { error in
            failure(error)
        }
    }
    
    func getPostsForUser(user: User) -> [Post] {
        database.getPostsFor(user: user)
    }

}
