//
//  ReachabilityManager.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import Foundation
import Reachability

protocol ReachabilityProviding {
    var isNetworkReachable: Bool { get }
}

class ReachabilityManager: ReachabilityProviding {

    static let shared = ReachabilityManager()

    var isNetworkReachable: Bool { reachability.map { $0.connection != .unavailable } ?? true }

    private let reachability = try? Reachability()

    private init() {
        try? reachability?.startNotifier()
    }
}
