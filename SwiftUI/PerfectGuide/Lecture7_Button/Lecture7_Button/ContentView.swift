//
//  ContentView.swift
//  Lecture7_Button
//
//  Created by Leo on 2023/08/03.
//

import SwiftUI

// Button

// State (Property wrapper)
// 하나의 뷰 안에서 사용되는 값
// state로 되어있으면, UI가 자동으로 갱신됨

struct ContentView: View {

    @State private var didSelected = false
    var mutateTest = false
    
    var buttonImage: String {
        didSelected ? "circle" : "pencil"
    }

    var body: some View {
        
        VStack{
            Button(action: {
                didSelected.toggle()
                // mutateTest.toggle()
                // Cannot use mutating member on immutable value: 'self' is immutable
            }, label: { // 트레일링 클로저니까 생략가능
                HStack{
                    Image(systemName: buttonImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack {
                        Text("Button")
                        Text("Button \(didSelected.description)")
                    }
                }
            }).padding(.bottom, 100)
            
            Text("current status: \(didSelected.description)")
        }
        .frame(width: 200, height: 150)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
