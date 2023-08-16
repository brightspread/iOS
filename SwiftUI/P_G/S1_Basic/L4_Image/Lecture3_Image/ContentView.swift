//
//  ContentView.swift
//  Lecture3_Image
//
//  Created by Leo on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // 이미지는 VStack에서 spacing이 기본 8정도로 설정되어있음
            Image("sample")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                .mask(
                    HStack {
                        VStack(spacing:0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing:0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                    }
                )
            
        }
        
//        Image("sample")
//            .resizable() // 지정해야 이미지 사이즈가 변경됨
//            .edgesIgnoringSafeArea(.all)
//            .aspectRatio(contentMode: .fit) // 원본 비율 유지
////            .frame(width: 300, height: 200)
////            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
