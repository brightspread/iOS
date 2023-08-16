//
//  ContentView.swift
//  Lecture15_Grid
//
//  Created by Leo on 2023/08/12.
//

import SwiftUI

// Grid
// CollectionView

struct ContentView: View {
    
    var columns: [GridItem] {
        // fixed : 넓이 그대로 표현
        // flexible : 늘어남
        // adaptive : 쭉 나열될 수 있는 영역 만큼 나열
        [GridItem(.adaptive(minimum: 100, maximum: 100))]
    }
    var body: some View {
        ScrollView(.vertical) { // Grid는 스크롤뷰 없음
            LazyVGrid(columns:columns) {
                Text("Hi Hello World!")
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
