//
//  ReachabilityStatus.swift
//  Pods
//
//  Created by Anıl Göktaş on 6/19/16.
//
//

import Foundation
import ReachabilitySwift

public final class ReachabilityStatus {
    
    public class var current: Reachability.NetworkStatus {
        guard let networkReachability = Reachability()
        else { return .notReachable }
        return networkReachability.currentReachabilityStatus
    }
    
    public class var isReachable: Bool {
        return current != .notReachable
    }
    
}
