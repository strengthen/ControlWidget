//
//  ContentView.swift
//  ControlWidget
//
//  Created by iNFC on 2030/1/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                if let url = URL(string: "https://apps.apple.com/cn/app/infc/id1562054959") {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("iNFC\nThe most powerful NFC application")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
