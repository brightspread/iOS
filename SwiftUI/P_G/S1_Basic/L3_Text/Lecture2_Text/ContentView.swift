//
//  ContentView.swift
//  Lecture2_Text
//
//  Created by Leo on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World! Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
                .font(.largeTitle)
                .underline()
                .bold()
                .padding()
                .foregroundColor(.blue)
//                .lineLimit(1)
                .lineSpacing(30)
                .truncationMode(.middle)
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
