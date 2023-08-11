//
//  ContentView.swift
//  Lecture11_ViewModifier
//
//  Created by Leo on 2023/08/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Main Title")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
            Text("Sub Title!")
                .font(.title2)
                .italic()
            Text("Description!")
                .font(.title2)
                .foregroundColor(.orange)
                .italic()
                .padding(.bottom, 20)
            Text("Description!")
                .modifier(MyTextStyle())
            Text("Description!")
                .customFont()
        }
    }
}

struct MyTextStyle: ViewModifier {
    var myWeight = Font.Weight.regular
    var myFont = Font.title2
    var myColor = Color.black
    // ViewModifier에서 가끔 사용할 수 없는 것들도 있음(italic 같은거나)
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            .italic()
            .padding(.bottom, 20)
    }
}

// Extension의 특징은 ViewModifier처럼 변수 설정(myWeight)이 불가능
// customFont(color: Color) 이런식으로 하면 됨
extension Text {
    func customFont() -> Text {
        self
            .font(.title2)
            .bold()
            .italic()
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
