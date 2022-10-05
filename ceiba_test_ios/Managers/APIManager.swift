//
//  APIManager.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import Foundation
import Alamofire

class APIManager {

    static let shared = APIManager()
    
    func getPosts(success: @escaping(_ posts: [Post]) -> Void, failure: @escaping(_ error: Error?) -> Void) {
        
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get).validate(statusCode: 200..<300).responseDecodable(of: PostsResponse.self) { response in
            if let error = response.error {
                failure(error)
            } else {
                guard let posts = try? response.result.get() else {
                    failure(nil)
                    return
                }
                success(posts)
            }
        }
    }
    
    func getUsers(success: @escaping(_ posts: [User]) -> Void, failure: @escaping(_ error: Error?) -> Void) {
        
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get).validate(statusCode: 200..<300).responseDecodable(of: UsersResponse.self) { response in
            if let error = response.error {
                failure(error)
            } else {
                guard let users = try? response.result.get() else {
                    failure(nil)
                    return
                }
                success(users)
            }
        }
    }
}
