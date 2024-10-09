//
//  PropediumWidgetExtensionLiveActivity.swift
//  PropediumWidgetExtension
//
//  Created by 唐依纳 on 2023/11/9.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PropediumWidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PropediumWidgetExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PropediumWidgetExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PropediumWidgetExtensionAttributes {
    fileprivate static var preview: PropediumWidgetExtensionAttributes {
        PropediumWidgetExtensionAttributes(name: "World")
    }
}

extension PropediumWidgetExtensionAttributes.ContentState {
    fileprivate static var smiley: PropediumWidgetExtensionAttributes.ContentState {
        PropediumWidgetExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PropediumWidgetExtensionAttributes.ContentState {
         PropediumWidgetExtensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PropediumWidgetExtensionAttributes.preview) {
   PropediumWidgetExtensionLiveActivity()
} contentStates: {
    PropediumWidgetExtensionAttributes.ContentState.smiley
    PropediumWidgetExtensionAttributes.ContentState.starEyes
}
