//
//  DBManager.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import Foundation
import RealmSwift

class DBManager: NSObject {
    static let shared = DBManager()

    func instantiateRealm() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Could not create a Realm instance")
        }
    }
    
    var users: [User] {
        Array(instantiateRealm().objects(User.self))
    }
    
    func saveUsers(users: [User]) {
        let realm = instantiateRealm()
        
        realm.beginWrite()
        realm.delete(self.users)
        realm.add(users)
        do {
           try realm.commitWrite()
        } catch {
            fatalError("Error saving users")
        }
    }
    
    func savePosts(posts: [Post]) {
        let realm = instantiateRealm()
        
        realm.beginWrite()
        realm.delete(realm.objects(Post.self))
        realm.add(posts)
        do {
           try realm.commitWrite()
        } catch {
            fatalError("Error saving posts")
        }
    }
    
    func getPostsFor(user: User, posts: [Post]? = nil) -> [Post] {
        if let posts = posts {
            return posts.filter({ $0.userID == user.id })
        }
        return Array(instantiateRealm().objects(Post.self).where({ $0.userID == user.id }))
    }
}
