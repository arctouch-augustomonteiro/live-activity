//
//  CounterAttributes.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 25/11/24.
//

import ActivityKit
import Combine

struct CounterAttributes: ActivityAttributes {
    // Dynamic variables
    struct ContentState: Codable, Hashable {
        let count: Int
    }
    
    // Static properties
    let session: String
}

public final class CounterAttributesSharedState: ObservableObject {
    public static let shared = CounterAttributesSharedState()
    private init() { }

    @Published public var didTapAddButton = false
    @Published public var didTapSubtractButton = false
}
