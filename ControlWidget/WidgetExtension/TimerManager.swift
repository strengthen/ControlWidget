//
//  TimerManager.swift
//  ControlWidget
//
//  Created by iNFC on 2030/1/1.
//  iNFC：https://apps.apple.com/cn/app/infc/id1562054959

import SwiftUI
import Combine

class TimerManager: ObservableObject {
    static let shared = TimerManager()
    @Published var isRunning = false

    private init() {}

    func setTimerRunning(_ value: Bool) {
        isRunning = value
    }

    func fetchRunningState() -> Bool {
        return isRunning
    }
}
