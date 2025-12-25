//
//  ContentView.swift
//  TestSheet
//
//  Created by Tornike Bardadze on 25.12.25.
//

import SwiftUI

struct ContentView: View {

    @State private var showSplash: Bool = true
    @State private var isSmallSheetPresented: Bool = false
    @State private var isMediumSheetPresented: Bool = false
    @State private var isBigSheetPresented: Bool = false
    @State private var isDynamicSheetPresented: Bool = false
    @State private var dynamicItemsCount: Int = 3
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var soundEnabled = true
    @State private var locationEnabled = false
    @State private var autoSyncEnabled = true
    @State private var cellularDataEnabled = true
    @State private var bluetoothEnabled = false
    @State private var airplaneModeEnabled = false
    @State private var lowPowerModeEnabled = false
    @State private var faceIDEnabled = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashScreen()
                    .transition(.opacity)
                    .zIndex(1)
            } else {
                mainContent
                    .transition(.opacity)
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.easeInOut(duration: 0.5)) {
                showSplash = false
            }
        }
    }

    var mainContent: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.7), .purple.opacity(0.8)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                VStack(spacing: 12) {
                    Image(systemName: "gearshape.2.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10)

                    Text("Dynamic Sheet Demo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    Text("Experience adaptive sheet sizing")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.9))
                }

                VStack(spacing: 16) {
                    SheetButton(
                        title: "Small Sheet",
                        icon: "rectangle.compress.vertical",
                        color: .green
                    ) {
                        isSmallSheetPresented.toggle()
                    }

                    SheetButton(
                        title: "Medium Sheet",
                        icon: "rectangle",
                        color: .orange
                    ) {
                        isMediumSheetPresented.toggle()
                    }

                    SheetButton(
                        title: "Big Sheet",
                        icon: "rectangle.expand.vertical",
                        color: .pink
                    ) {
                        isBigSheetPresented.toggle()
                    }

                    SheetButton(
                        title: "Live Dynamic Sheet",
                        icon: "arrow.up.and.down.circle.fill",
                        color: .purple
                    ) {
                        isDynamicSheetPresented.toggle()
                        dynamicItemsCount = 3
                    }
                }
                .padding(.horizontal, 40)
            }
        }
        .dynamicHeightSheet(isPresented: $isSmallSheetPresented) {
            SettingsContent(
                title: "Quick Settings",
                settings: [
                    SettingItem(
                        title: "Notifications",
                        description: "Receive alerts",
                        icon: "bell.fill",
                        color: .blue,
                        binding: $notificationsEnabled
                    ),
                    SettingItem(
                        title: "Dark Mode",
                        description: "Dark theme",
                        icon: "moon.fill",
                        color: .indigo,
                        binding: $darkModeEnabled
                    ),
                    SettingItem(
                        title: "Sound",
                        description: "Audio feedback",
                        icon: "speaker.wave.2.fill",
                        color: .green,
                        binding: $soundEnabled
                    )
                ]
            )
        }
        .dynamicHeightSheet(isPresented: $isMediumSheetPresented) {
            SettingsContent(
                title: "General Settings",
                settings: [
                    SettingItem(
                        title: "Notifications",
                        description: "Receive alerts and updates",
                        icon: "bell.fill",
                        color: .blue,
                        binding: $notificationsEnabled
                    ),
                    SettingItem(
                        title: "Dark Mode",
                        description: "Switch to dark theme",
                        icon: "moon.fill",
                        color: .indigo,
                        binding: $darkModeEnabled
                    ),
                    SettingItem(
                        title: "Sound Effects",
                        description: "Play audio feedback",
                        icon: "speaker.wave.2.fill",
                        color: .green,
                        binding: $soundEnabled
                    ),
                    SettingItem(
                        title: "Location Services",
                        description: "Allow location access",
                        icon: "location.fill",
                        color: .red,
                        binding: $locationEnabled
                    ),
                    SettingItem(
                        title: "Auto Sync",
                        description: "Sync data automatically",
                        icon: "arrow.triangle.2.circlepath",
                        color: .orange,
                        binding: $autoSyncEnabled
                    ),
                    SettingItem(
                        title: "Cellular Data",
                        description: "Use mobile data",
                        icon: "antenna.radiowaves.left.and.right",
                        color: .cyan,
                        binding: $cellularDataEnabled
                    )
                ]
            )
        }
        .dynamicHeightSheet(isPresented: $isBigSheetPresented) {
            SettingsContent(
                title: "All Settings",
                settings: [
                    SettingItem(
                        title: "Notifications",
                        description: "Receive alerts and updates",
                        icon: "bell.fill",
                        color: .blue,
                        binding: $notificationsEnabled
                    ),
                    SettingItem(
                        title: "Dark Mode",
                        description: "Switch to dark theme",
                        icon: "moon.fill",
                        color: .indigo,
                        binding: $darkModeEnabled
                    ),
                    SettingItem(
                        title: "Sound Effects",
                        description: "Play audio feedback",
                        icon: "speaker.wave.2.fill",
                        color: .green,
                        binding: $soundEnabled
                    ),
                    SettingItem(
                        title: "Location Services",
                        description: "Allow location access",
                        icon: "location.fill",
                        color: .red,
                        binding: $locationEnabled
                    ),
                    SettingItem(
                        title: "Auto Sync",
                        description: "Sync data automatically",
                        icon: "arrow.triangle.2.circlepath",
                        color: .orange,
                        binding: $autoSyncEnabled
                    ),
                    SettingItem(
                        title: "Cellular Data",
                        description: "Use mobile data",
                        icon: "antenna.radiowaves.left.and.right",
                        color: .cyan,
                        binding: $cellularDataEnabled
                    ),
                    SettingItem(
                        title: "Bluetooth",
                        description: "Connect to devices",
                        icon: "bluetooth",
                        color: .blue,
                        binding: $bluetoothEnabled
                    ),
                    SettingItem(
                        title: "Airplane Mode",
                        description: "Disable all wireless",
                        icon: "airplane",
                        color: .orange,
                        binding: $airplaneModeEnabled
                    ),
                    SettingItem(
                        title: "Low Power Mode",
                        description: "Reduce power consumption",
                        icon: "battery.25",
                        color: .yellow,
                        binding: $lowPowerModeEnabled
                    ),
                    SettingItem(
                        title: "Face ID",
                        description: "Unlock with face",
                        icon: "faceid",
                        color: .green,
                        binding: $faceIDEnabled
                    )
                ]
            )
        }
        .dynamicHeightSheet(isPresented: $isDynamicSheetPresented) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Live Dynamic Sheet")
                    .font(.title2)
                    .fontWeight(.bold)

                VStack(spacing: 0) {
                    ForEach(0..<dynamicItemsCount, id: \.self) { index in
                        HStack(spacing: 12) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue.opacity(0.15))
                                    .frame(width: 36, height: 36)
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.blue)
                                    .font(.system(size: 16))
                            }

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Item \(index + 1)")
                                    .fontWeight(.medium)
                                Text("Dynamic content item")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()
                        }
                        .padding(.vertical, 12)

                        if index < dynamicItemsCount - 1 {
                            Divider()
                                .padding(.leading, 48)
                        }
                    }
                }

                Button {
                    dynamicItemsCount += 1
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                }
                .padding(.top, 8)
            }
            .padding()
        }
    }
}

struct SplashScreen: View {
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 100))
                    .foregroundStyle(.white)
                    .scaleEffect(scale)
                    .opacity(opacity)

                Text("Dynamic Sheet")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundStyle(.white)
                    .opacity(opacity)

                Text("Auto-sizing sheets for SwiftUI")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.9))
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.spring(duration: 0.8, bounce: 0.3)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}

struct SheetButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(color)
            .foregroundStyle(.white)
            .cornerRadius(14)
            .shadow(color: color.opacity(0.4), radius: 8, y: 4)
        }
    }
}

struct SettingItem {
    let title: String
    let description: String
    let icon: String
    let color: Color
    let binding: Binding<Bool>
}

struct SettingsContent: View {
    let title: String
    let settings: [SettingItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            VStack(spacing: 0) {
                ForEach(settings.indices, id: \.self) { index in
                    Toggle(isOn: settings[index].binding) {
                        HStack(spacing: 12) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(settings[index].color.opacity(0.15))
                                    .frame(width: 36, height: 36)
                                Image(systemName: settings[index].icon)
                                    .foregroundStyle(settings[index].color)
                                    .font(.system(size: 16))
                            }

                            VStack(alignment: .leading, spacing: 2) {
                                Text(settings[index].title)
                                    .fontWeight(.medium)
                                Text(settings[index].description)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.vertical, 12)

                    if index < settings.count - 1 {
                        Divider()
                            .padding(.leading, 48)
                    }
                }
            }
        }
        .padding()
    }
}


// MARK: - DynamicHeightSheetModifier

struct DynamicHeightSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let sheetContent: SheetContent

    @State private var totalHeight: CGFloat = .zero
    @State private var contentHeight: CGFloat = .zero

    init(
        isPresented: Binding<Bool>,
        sheetContent: @escaping () -> SheetContent
    ) {
        _isPresented = isPresented
        self.sheetContent = sheetContent()
    }

    private var scrollThreshold: CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first,
              let window = windowScene.windows.first
        else {
            return UIScreen.main.bounds.height * 0.7
        }
        return window.bounds.height * 0.7
    }

    private var shouldUseScrollView: Bool {
        contentHeight > scrollThreshold
    }

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                sheetBody
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .task {
                                    updateTotalHeight(proxy.size.height)
                                }
                                .onChange(of: proxy.size.height) { newHeight in
                                    withAnimation(
                                        .snappy(
                                            duration: 0.25,
                                            extraBounce: 0
                                        )
                                    ) {
                                        updateTotalHeight(newHeight)
                                    }
                                }
                        }
                    )
                    .presentationDragIndicator(.visible)
                    .presentationDetents(
                        totalHeight == .zero
                            ? [.height(largeDetentHeight())]
                            : [.height(totalHeight)]
                    )
            }
    }

    @ViewBuilder
    private var sheetBody: some View {
        baseContentView
    }

    private var baseContentView: some View {
        Group {
            if shouldUseScrollView {
                ScrollView {
                    contentView
                }
                .frame(maxHeight: largeDetentHeight())
            } else {
                contentView
            }
        }
    }

    private var contentView: some View {
        VStack {
            sheetContent
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            GeometryReader { proxy in
                Color.clear
                    .task {
                        updateContentHeight(proxy.size.height)
                    }
                    .onChange(of: proxy.size.height) { newHeight in
                        updateContentHeight(newHeight)
                    }
            }
        )
    }

    private func updateTotalHeight(_ newHeight: CGFloat) {
        if totalHeight != newHeight, newHeight > 0 {
            totalHeight = newHeight
        }
    }

    private func updateContentHeight(_ newHeight: CGFloat) {
        if contentHeight != newHeight, newHeight > 0 {
            contentHeight = newHeight
        }
    }
    
    private func largeDetentHeight() -> CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first,
              let window = windowScene.windows.first
        else {
            return UIScreen.main.bounds.height * 0.8
        }

        let screenHeight = window.bounds.height

        return screenHeight * 0.8
    }
}


extension View {
    public func dynamicHeightSheet(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        modifier(
            DynamicHeightSheetModifier(
                isPresented: isPresented,
                sheetContent: content
            )
        )
    }
}
