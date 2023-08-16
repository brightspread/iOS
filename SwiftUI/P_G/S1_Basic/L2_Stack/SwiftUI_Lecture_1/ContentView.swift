//
//  ContentView.swift
//  SwiftUI_Lecture_1
//
//  Created by Leo on 2023/08/02.
//

import SwiftUI

// Stack
// H V Z 스택이 있음
/*
 Vertical Stack 형태로 나옴
 
 VStack{
     Text("Hello, world!")
     Text("Hello, world!")
     Text("Hello, world!")
 }
 
 기본적으로 가운데 정렬됨
 
 ZStack : Z축으로 쌓임
 
 Color - 전체 크기로 잡음
 Image, Text - 컨텐츠 크기로 잡음
 
 설정 값들은 줄바꿔서 하는 것이 관습
 Text("Hello")
    .font(.largeTitle)
    .foregroundColor(.red)
    .padding(.top, 50)
 
 Color.green
    .edgesIgnoringSafeArea(.all)

 */

struct ContentView: View {
    var body: some View {
//        VStack{
//            Color.yellow // 크기가 없으면 전체가 크기로 잡힘. safe area는 침범하지 못함
//            Text("Hello") // 크기만큼 차지함
//            Text("Hello, world!").background(Color.red)
        
        ZStack{
            Color.green
                .edgesIgnoringSafeArea(.all) // safe area까지 채움
            VStack {
                HStack {
                    Text("Hello")
                    Text("Hello")
                    Text("Hello")
                }.padding(.bottom, 100)
                
                Text("Hello")
            }
        } // 배경을 깔려면 Z로 해야함. 아니면 아래 텍스트가 차지하게됨.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
