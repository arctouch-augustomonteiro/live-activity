//
//  ContentView.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 25/11/24.
//

import SwiftUI

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            label
            HStack {
                minusButton
                plusButton
            }
        }
    }
    
    private var label: some View {
        Text("Count: \(viewModel.count)")
            .font(.largeTitle)
            .bold()
    }
    
    private var minusButton: some View {
        Button { viewModel.subtract() } label: {
            Image(systemName: "minus.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.red)
        }
    }
    
    private var plusButton: some View {
        Button { viewModel.add() } label: {
            Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
    }
}

#Preview {
    CounterView()
}
