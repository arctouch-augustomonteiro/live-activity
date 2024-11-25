//
//  CounterViewModel.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 25/11/24.
//

import Foundation

@MainActor
class CounterViewModel: ObservableObject {
    @Published private(set) var count: Int = 0
    
    func add() {
        count += 1
    }
    
    func subtract() {
        count -= 1
    }
}
