//
//  WidgetButton.swift
//  ControlWidget
//
//  Created by iNFC on 2030/1/1.
//  iNFC：https://apps.apple.com/cn/app/infc/id1562054959  

import Foundation
import WidgetKit
import SwiftUI
import AppIntents
import UIKit
import Combine

// 使用 ControlWidget 协议来定义一个基础控件,定义了一个新的结构体 WidgetToggle，它实现了 ControlWidget 协议。
struct WidgetButton: ControlWidget {
    // body属性表示该 WidgetButton 中包含的控件列表。
    var body: some ControlWidgetConfiguration {
        // // 这是一个静态配置，用于定义控件的结构：外观和行为。
        StaticControlConfiguration(
            kind: "com.apple.ControlWidgetButton"
        ) {
            // 定义了一个打开容器App的控件，
            ControlWidgetButton(action: OpenContainerAction()) {
                Label("WidgetButton", systemImage: "paperplane")
            } actionLabel: { isActive in
                if isActive {
                    Label("WidgetButton", systemImage: "hourglass")
                }
            }
        }
        .displayName("iNFC")
        .description("The most powerful NFC application")
    }
}

struct OpenContainerAction: AppIntent {
    // // 本地化字符串资源
    static let title: LocalizedStringResource = "WidgetButton"
    // 定义了执行意图时的操作。
    func perform() async throws -> some IntentResult & OpensIntent {
        // 保存数据到Group App容器，传递给主应用
        if let appGroupDefaults = UserDefaults(suiteName: "group.com.apple.iNFC") {
            if appGroupDefaults.bool(forKey: "widgetExtensionData") {
                appGroupDefaults.set(false, forKey: "widgetExtensionData")
            } else {
                appGroupDefaults.set(true, forKey: "widgetExtensionData")
            }
        }
        // 重要：打开容器App的操作
        return .result(opensIntent: OpenURLIntent(URL(string: "iNFC://")!))
    }
}
