//
//  CounterAppIntent.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 25/11/24.
//

import ActivityKit
import AppIntents

struct CounterAddAppIntent: LiveActivityIntent {
    static var title = LocalizedStringResource("Add")
    static var isDiscoverable = false

    init() { }

    @MainActor
    func perform() async throws -> some IntentResult {
        CounterAttributesSharedState.shared.didTapAddButton.toggle()
        return .result()
    }
}


struct CounterSubtractAppIntent: LiveActivityIntent {
    static var title = LocalizedStringResource("Subtract")
    // static var openAppWhenRun = true
    static var isDiscoverable = false

    init() { }

    @MainActor
    func perform() async throws -> some IntentResult {
        CounterAttributesSharedState.shared.didTapSubtractButton.toggle()
        return .result()
    }
}
