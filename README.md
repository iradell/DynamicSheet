# Dynamic Sheet for SwiftUI

A flexible, auto-sizing sheet modifier for SwiftUI that automatically adjusts its height based on content size with smooth animations.

## Features

- ✨ **Automatic Height Adjustment** - Sheet dynamically sizes to fit content
- 🎯 **Smooth Animations** - Fluid transitions when content changes
- 📱 **Responsive Design** - Adapts to different screen sizes
- 🔄 **Smart Scrolling** - Automatically enables scrolling when content exceeds 70% of screen height
- 🎨 **SwiftUI Native** - Built with SwiftUI, works seamlessly with existing views
- 🚀 **Easy to Use** - Simple modifier-based API

## Installation

Simply copy the `DynamicHeightSheetModifier` code from `ContentView.swift` into your project.

## Usage

### Basic Example

```swift
import SwiftUI

struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        Button("Show Sheet") {
            isPresented.toggle()
        }
        .dynamicHeightSheet(isPresented: $isPresented) {
            VStack {
                Text("Hello, Dynamic Sheet!")
                Text("Content automatically sizes the sheet")
            }
            .padding()
        }
    }
}
```

### Advanced Example with Settings

```swift
struct SettingsView: View {
    @State private var isPresented = false
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false

    var body: some View {
        Button("Open Settings") {
            isPresented.toggle()
        }
        .dynamicHeightSheet(isPresented: $isPresented) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Settings")
                    .font(.title2)
                    .fontWeight(.bold)

                Toggle("Notifications", isOn: $notificationsEnabled)
                Toggle("Dark Mode", isOn: $darkModeEnabled)
            }
            .padding()
        }
    }
}
```

### Dynamic Content Example

```swift
struct DynamicContentView: View {
    @State private var isPresented = false
    @State private var itemCount = 3

    var body: some View {
        Button("Show List") {
            isPresented.toggle()
        }
        .dynamicHeightSheet(isPresented: $isPresented) {
            VStack {
                ForEach(0..<itemCount, id: \.self) { index in
                    Text("Item \(index + 1)")
                }

                Button("Add Item") {
                    itemCount += 1
                }
            }
            .padding()
        }
    }
}
```

## How It Works

The Dynamic Sheet uses `GeometryReader` to measure content height in real-time and automatically adjusts the sheet's presentation detent accordingly.

### Key Behaviors

- **Small Content**: Sheet sizes exactly to content height
- **Large Content**: When content exceeds 70% of screen height, a ScrollView is automatically enabled
- **Max Height**: Capped at 80% of screen height when scrolling is enabled
- **Animations**: All height changes are animated with a snappy spring animation (0.25s duration)

## API Reference

### Modifier

```swift
func dynamicHeightSheet<Content: View>(
    isPresented: Binding<Bool>,
    @ViewBuilder content: @escaping () -> Content
) -> some View
```

**Parameters:**
- `isPresented`: Binding to control sheet visibility
- `content`: ViewBuilder closure that returns the sheet content

## Customization

You can customize the behavior by modifying these values in `DynamicHeightSheetModifier`:

```swift
// Scroll threshold (default: 70% of screen height)
private var scrollThreshold: CGFloat {
    window.bounds.height * 0.7
}

// Max sheet height (default: 80% of screen height)
private func largeDetentHeight() -> CGFloat {
    screenHeight * 0.8
}

// Animation configuration
.snappy(duration: 0.25, extraBounce: 0)
```

## Requirements

- iOS 16.0+
- SwiftUI
- Xcode 15.0+

## Demo App

The included demo app showcases various use cases:

1. **Small Sheet** - Compact settings (3 items)
2. **Medium Sheet** - General settings (6 items)
3. **Big Sheet** - All settings (10 items) with scrolling
4. **Live Dynamic Sheet** - Add items dynamically to see real-time height adjustment

## License

This project is available under the MIT License.

## Author

Created by Tornike Bardadze

## Contributing

Contributions, issues, and feature requests are welcome!

---

Made with ❤️ using SwiftUI
