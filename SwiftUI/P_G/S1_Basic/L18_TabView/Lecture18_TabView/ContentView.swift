//
//  ContentView.swift
//  Lecture18_TabView
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            First()
                .tabItem {
                    Image(systemName: "person")
                    Text("Person")
                }
                .edgesIgnoringSafeArea(.top)
            Second()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("person.fill")
                }
        }
    }
}

struct First: View {
    var body: some View {
        ZStack {
            Color.orange
            Text("First")
        }
    }
}

struct Second: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("Second")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
