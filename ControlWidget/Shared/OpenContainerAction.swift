//
//  OpenContainerAction.swift
//  ControlWidget
//
//  打开主应用的 Intent，必须同时加入主应用和 Widget 扩展 target 才能唤起应用
//

import AppIntents
import Foundation

/// 打开主应用的 Intent
struct OpenContainerAction: AppIntent {
    static let title: LocalizedStringResource = "WidgetButton"
    static var openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult & OpensIntent {
        // 保存数据到 Group App 容器，传递给主应用
        if let appGroupDefaults = UserDefaults(suiteName: "group.apple.iNFC") {
            appGroupDefaults.set(!appGroupDefaults.bool(forKey: "widgetExtensionData"), forKey: "widgetExtensionData")
        }
        // 使用 OpenURLIntent 唤起主应用（iNFC:// 在 Info.plist 中已声明）
        let url = URL(string: "iNFC://")!
        return .result(opensIntent: OpenURLIntent(url))
    }
}
