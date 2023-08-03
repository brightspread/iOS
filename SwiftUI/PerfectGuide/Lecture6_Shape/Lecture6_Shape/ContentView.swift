//
//  ContentView.swift
//  Lecture6_Shape
//
//  Created by Leo on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .stroke(Color.orange,
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round, // 라인의 앞뒤 모양
                            lineJoin: .round // 라인 붙이는 부분
                        )
                )
        }
        .frame(width: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
