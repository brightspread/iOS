//
//  ContentView.swift
//  Lecture23_State
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

// State

// SwiftUI는 structure 구조 형태를 기준으로 만들어져있음
// struct는 기본적으로 변수를 가지고 있으면서, 변경이 불가능(mutating 을 써야됨)
// 클래스에서 변수를 선언해서 사용하는 것처럼 만들어주는 기능이 State라고 생각하면 됨

struct ContentView: View {
    
    //    var myName = "kim" // 변경 불가
    @State private var myName = "kim"
    // String, Int, Bool 은 State를 쓰면 됨 (spec)
    // 다른 뷰에 넘겨줘도 됨

    var body: some View {
        
        VStack {
            Text(myName)
                .padding()
            
            Button("change name") {
                myName = "lee"
                // 구조체 - Cannot assign to property: 'self' is immutable
            }
        
            TextField("TF Title", text: $myName)
            // 바인딩하면 변경시 property 변경됨
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
