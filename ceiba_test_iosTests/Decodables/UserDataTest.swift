//
//  UserDataTest.swift
//  ceiba_test_iosTests
//
//  Created by smendoza on 5/10/22.
//

import XCTest
@testable import ceiba_test_ios

class UserDataTest: XCTestCase {
    
    func testCanParseUser() throws {
        let json = """
        {
            "id": 100002,
            "name": "Leanne Graham",
            "username": "Bret",
            "email": "Sincere@april.biz",
            "address": {
              "street": "Kulas Light",
              "suite": "Apt. 556",
              "city": "Gwenborough",
              "zipcode": "92998-3874",
              "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
              }
            },
            "phone": "1-770-736-8031 x56442",
            "website": "hildegard.org",
            "company": {
              "name": "Romaguera-Crona",
              "catchPhrase": "Multi-layered client-server neural-net",
              "bs": "harness real-time e-markets"
            }
          }
        """
        
        let jsonData = json.data(using: .utf8)!
        let userData = try! JSONDecoder().decode(User.self, from: jsonData)
        
        XCTAssertEqual(100002, userData.id)
        XCTAssertEqual("Leanne Graham", userData.name)
        XCTAssertEqual("1-770-736-8031 x56442", userData.phone)
        XCTAssertEqual("Sincere@april.biz", userData.email)
    }
    
}
