//
//  ContentView.swift
//  Lecture22_ScrollViewReader
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var proxy: ScrollViewProxy?

    var body: some View {
        
        VStack {
            Button("Scroll To") {
                withAnimation(.easeInOut) {
                    proxy?.scrollTo(20, anchor: .top)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    // self.proxy = proxy // 뷰를 그리는 부분이라 이건 안됨
                    ForEach(0..<50) { index in
                        Text("\(index)")
                            .padding()
                            .id(index) // 아이디 지정해줘야함
                    }
                    .onAppear(perform: {
                        self.proxy = proxy
                    })
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
