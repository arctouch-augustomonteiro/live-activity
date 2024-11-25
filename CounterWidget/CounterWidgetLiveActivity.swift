//
//  CounterWidgetLiveActivity.swift
//  LiveActivity
//
//  Created by Augusto Monteiro on 22/11/24.
//

import ActivityKit
import SwiftUI
import WidgetKit

struct CounterWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CounterAttributes.self) { context in
            LiveActivityView(title: context.attributes.session, state: context.state)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Count: \(context.state.count)")
                }
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.attributes.session)
                        .padding(.vertical)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    ArcTouchLogo(size: 42)
                }
            } compactLeading: {
                Text("\(context.state.count)")
            } compactTrailing: {
                ArcTouchLogo()
            } minimal: {
                ArcTouchLogo()
            }
        }
    }
}

// MARK: - Image

struct ArcTouchLogo: View {
    private let size: CGFloat
    
    init(size: CGFloat = 24) {
        self.size = size
    }
    
    var body: some View {
        Image(.image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: size, height: size)
    }
}

// MARK: - Live Activity

struct LiveActivityView: View {
    let title: String
    let state: CounterAttributes.ContentState
   
    var body: some View {
        HStack {
            minusButton
            Spacer()
            VStack {
                Text("\(title)").bold()
                Text("Count: \(state.count)")
            }
            Spacer()
            plusButton
        }
        .padding()
    }
    
    private var minusButton: some View {
        Button {
            // Add action
        } label: {
            Image(systemName: "minus.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.red)
        }
        .buttonStyle(.plain)
    }
    
    private var plusButton: some View {
        Button {
            // Add action
        } label: {
            Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.green)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview

struct LiveActivitiesPreviewProvider: PreviewProvider {
    static let activityAttributes = CounterAttributes(session: "Preview")
    static let state = CounterAttributes.ContentState(count: 5)

    static var previews: some View {
        activityAttributes
            .previewContext(state, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Compact")

        activityAttributes
            .previewContext(state, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Expanded")

        activityAttributes
            .previewContext(state, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")

        activityAttributes
            .previewContext(state, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
