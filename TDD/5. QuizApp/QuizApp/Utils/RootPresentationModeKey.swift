//
//  RootPresentationModeKey.swift
//  QuizApp
//
//  Created by Leo on 2023/07/07.
//

import Foundation
import SwiftUI 

typealias RootPresentationMode = QuizViewModel?

private struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<RootPresentationMode> = .constant(nil)
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

extension RootPresentationMode {
    mutating func dismiss() {
        self = nil 
    }
}
