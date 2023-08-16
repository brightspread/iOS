//
//  Lecture26_EnvironmentObjectApp.swift
//  Lecture26_EnvironmentObject
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

@main
struct Lecture26_EnvironmentObjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MyInfo()) // 실제론 여기서 넣어줘야 들어감
                .environmentObject(MyLocation())
        }
    }
}
