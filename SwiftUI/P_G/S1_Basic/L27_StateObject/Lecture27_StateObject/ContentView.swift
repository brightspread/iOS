//
//  ContentView.swift
//  Lecture27_StateObject
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

// StateObject

// ObservableObject와 비슷

class MyInfo: ObservableObject {
    @Published var myScore = 0
}

struct ContentView: View {
    
    @ObservedObject var myInfo = MyInfo()
//    @StateObject var myInfo2 = MyInfo()

    var body: some View {
        VStack {
            Text("\(myInfo.myScore)")
                .font(.largeTitle)
                .padding()

            Button("Plus1") {
                myInfo.myScore += 1
            }
            
            // 여기선 위와 동작 동일
            /*
            Text("\(myInfo2.myScore)")
                .font(.largeTitle)
                .padding()

            Button("Plus2") {
                myInfo2.myScore += 1
            }
             */
            
            CustomButton()

        }
        .padding()
    }
}

struct CustomButton: View {
    @StateObject var myInfo2 = MyInfo() // View가 갱신되는 상황에서 값 유지됨
    
    // @ObservedObject var myInfo2 = MyInfo()
    // ObservedObject로 하면, ContentView에서 버튼 누를때 MyInfo이 갱신됨
    // 0으로 바뀌어 버림

    var body: some View {
        Text("\(myInfo2.myScore)")
            .font(.largeTitle)
            .padding()

        Button("Plus2") {
            myInfo2.myScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
