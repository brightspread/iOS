//
//  ContentView.swift
//  Lecture28_AppStorage
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("Mode") var mode = false
    // UserDefaults와 비슷
    @AppStorage("Notification Count") var notiCount = ""

    var body: some View {
        ZStack {
            mode ? Color.orange.opacity(0.5) : Color.gray
            VStack {
                Button {
                    mode.toggle()
                } label: {
                    Text("Button")
                }
                TextField("noti count : ", text: $notiCount)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
