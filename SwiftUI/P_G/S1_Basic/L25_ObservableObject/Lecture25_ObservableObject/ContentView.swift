//
//  ContentView.swift
//  Lecture25_ObservableObject
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

// ObservableObject
// 여러가지 프로퍼티 사용시 쓰면 편함 - 보통 클래스에서 사용
// Published 하지 않으면 바인딩 적용X

class MyInfo: ObservableObject {
    @Published var myAge = 20
    @Published var myName = "Leo" // Published는 변경시 항상 보냄

    var notiName = "lin" {
        didSet {
            if oldValue.count == 0 { // 값이 0이 될때만
                objectWillChange.send() // UI로 보냄!
            }
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var myInfo = MyInfo()
    
    var body: some View {
        VStack {
            Text(myInfo.myName)
                .padding()
            Button("change name") {
                myInfo.myName = "leee"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
