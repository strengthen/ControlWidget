//
//  ControlWidgetApp.swift
//  ControlWidget
//
//  Created by iNFC on 2030/1/1.
//

import SwiftUI

@main
struct ControlWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    // 处理从 Control Widget 通过 iNFC:// 唤起时的 URL
                    if url.scheme == "iNFC" {
                        // 可在此处理深度链接逻辑
                    }
                }
        }
    }
}
