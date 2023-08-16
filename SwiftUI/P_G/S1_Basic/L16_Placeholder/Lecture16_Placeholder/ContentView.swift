//
//  ContentView.swift
//  Lecture16_Placeholder
//
//  Created by Leo on 2023/08/12.
//

import SwiftUI

// Placeholder
// redact

struct ContentView: View {
    
    @State private var myString = "Hello, world!"
    @State private var showPlaceholder = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                
                Text(myString)
                    .padding()
                    .redacted(reason: showPlaceholder ? .placeholder : .init())
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())
            Button("Click me") {
                showPlaceholder.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
