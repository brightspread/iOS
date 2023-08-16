//
//  ContentView.swift
//  Lecture26_EnvironmentObject
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

// EnvironmentObject (싱글톤과 비슷, SwiftUI에서 깔끔하게 작업됨)
class MyInfo: ObservableObject {
    @Published var name = ""
    @Published var photoURL = ""
    var token = "" // 화면에 표시 안되는 값
}

class MyLocation: ObservableObject {
    
}

struct ContentView: View {
    
    @EnvironmentObject var myInfo: MyInfo // 타입만 지정 가능, 메모리에 올라가있음
    @EnvironmentObject var myLocation: MyLocation
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Text("Navigate")
                }
                Text("name: \(myInfo.name)")
                    .font(.largeTitle)
                    .padding()
                Text("url: \(myInfo.photoURL)")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .onAppear {
            myInfo.name = "Kim"
            myInfo.photoURL = "https://aaa.com"
        }
    }
}

struct DetailView: View {
    
    @EnvironmentObject var myInfo: MyInfo // 동일하게 설정
    
    var body: some View {
        VStack {
            Text("Detail name: \(myInfo.name)")
                .font(.largeTitle)
                .padding()
            Text("Detail url: \(myInfo.photoURL)")
                .font(.largeTitle)
                .padding()
            Button("change Name") {
                myInfo.name = "Lee"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View { // 여긴 프리뷰니까 sceneDelegate에서 넣어줘야함!
        ContentView()
            .environmentObject(MyInfo()) // 여기서 주입
            .environmentObject(MyLocation())
    }
}
