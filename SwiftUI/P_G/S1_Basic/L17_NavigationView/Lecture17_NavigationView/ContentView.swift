//
//  ContentView.swift
//  Lecture17_NavigationView
//
//  Created by Leo on 2023/08/12.
//

import SwiftUI

// NavigationView

struct ContentView: View {
    
    init(){
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
        let myAppearance = UINavigationBarAppearance()
        myAppearance.titleTextAttributes = [
            .foregroundColor : UIColor.red,
            .font : UIFont.italicSystemFont(ofSize: 20)
        ]
        myAppearance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.blue,
            .font : UIFont.italicSystemFont(ofSize: 20)
        ]
        myAppearance.backgroundColor = .orange
        
        // 올라가있는 상태일때(standardAppearance)
        UINavigationBar.appearance().standardAppearance = myAppearance
        // scrollEdge
        UINavigationBar.appearance().scrollEdgeAppearance = myAppearance
        // compactAppearance (가로모드, 작을 때)
        UINavigationBar.appearance().compactAppearance = myAppearance
        
        // 그냥 하면 조금 달라지는게 있음
        // UINavigationBar.appearance().backgroundColor = .orange
        // -> statusbar는 적용 안됨. appearance 잡힌 부분만 됨.
        
        // NavigationLink 들어갔을 때 뒤로가기 색상(뭔가 안됨..)
        UINavigationBar.appearance().tintColor = .black
    }
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Text("Destination")
                } label: {
                    HStack {
                        Image(systemName: "person")
                        Text("Navigate")
                    }
                }

            }
            .navigationTitle("Hello")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
