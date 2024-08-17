//
//  WidgetExtensionBundle.swift
//  WidgetExtension
//
//  Created by iNFC on 2024/8/17.
//  iNFC：https://apps.apple.com/cn/app/infc/id1562054959  

import WidgetKit
import SwiftUI

//  标记：表示这是应用的入口点。它将这个 WidgetBundle 注册为应用的一部分。
@main
// Widget Bundle 是一种容器，允许你将多个控件组合在一起，以更好地组织和管理这些控件，并方便地在应用中启用或禁用它们。
// WidgetExtensionBundle这是我们定义的 WidgetBundle 名称。
struct WidgetExtensionBundle: WidgetBundle {
    // body属性表示该 WidgetBundle 中包含的控件列表。你可以在这里添加任意数量的控件。
    var body: some Widget {
        // 类型一：Toggles：切换控件，切换开关状态。
        WidgetToggle()
        // 类型二：Buttons：执行离散操作，打开App。
        WidgetButton()
    }
}
