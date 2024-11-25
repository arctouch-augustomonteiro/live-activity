//
//  CounterViewModel.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 25/11/24.
//

import ActivityKit
import Combine
import Foundation

@MainActor
class CounterViewModel: ObservableObject {
    @Published private var activity: Activity<CounterAttributes>?
    @Published private(set) var count: Int = 0

    private var cancellables: Set<AnyCancellable> = []

    init() {
        $count
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink { [weak self] _ in
                self?.updateActivity()
            }
            .store(in: &cancellables)
    }
    
    func add() {
        count += 1
    }
    
    func subtract() {
        count -= 1
    }
}

// MARK: - Live Activity

extension CounterViewModel {
    var canStartLiveActivity: Bool {
        activity == nil
    }
    
    var activityContent: ActivityContent<CounterAttributes.ContentState> {
        let state = CounterAttributes.ContentState(count: count)
        return ActivityContent(state: state, staleDate: nil, relevanceScore: 1.0)
    }

    func startActivity() {
        let attributes = CounterAttributes(session: "Cocoabits!")
        do {
            activity = try Activity.request(attributes: attributes, content: activityContent)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateActivity() {
        Task {
            await activity?.update(activityContent)
        }
    }

    func endActivity() {
        Task {
            await activity?.end(activityContent, dismissalPolicy: .immediate)
            activity = nil
        }
    }
}
