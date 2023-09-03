//
//  Extensions.swift
//  InstagramSwiftUITutorial
//
//  Created by Leo on 2023/09/03.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
