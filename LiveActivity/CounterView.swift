//
//  CounterView.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 22/11/24.
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
            if viewModel.canStartLiveActivity {
                startActivityButton
            } else {
                endActivityButton
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

    private var startActivityButton: some View {
        Button {
            viewModel.startActivity()
        } label: {
            Text("Start Live Activity")
        }
    }
    
    private var endActivityButton: some View {
        Button {
            viewModel.endActivity()
        } label: {
            Text("End Live Activity")
        }
    }
}

#Preview {
    CounterView()
}
