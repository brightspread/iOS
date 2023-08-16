//
//  ContentView.swift
//  Lecture21_TextEditor
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    var body: some View {
        VStack {
            TextEditor(text: $inputText)
                .padding() // 패딩 0 이상 줘야 노치랑 떨어짐
                .lineSpacing(40)
                .font(.title)
                .disableAutocorrection(true) // 자동완성
                .onChange(of: inputText) { newValue in
                    if inputText.count > 50 { // 최대 글자수 제한
                        inputText.removeLast()
                    }
                }
            HStack {
                Spacer()
                Text("\(inputText.count)" + " / 50")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
