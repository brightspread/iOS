//
//  ContentView.swift
//  Assignment_Movie
//
//  Created by Leo on 2023/08/12.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    var body: some View {
        VStack {
            List {
                HStack {
                    TextField(text: $query, label: {
                        Text("무엇을 구매하실 건가요?")
                    })
                    Spacer()
                    
                    Button("추가") {
                        print("test")
                    }
                }

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
