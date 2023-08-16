//
//  ContentView.swift
//  Lecture8_Toggle
//
//  Created by Leo on 2023/08/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Toggle("Toggle title : \(isOn.description)", isOn: $isOn)
            // init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>)
            // isOn: Binding<Bool>
            
            // 변경되어야하는 UI와 바로 매칭되어야함
            // $ : 연결시켜주는 것
            MyToggle(isOn: $isOn)
            Text("\(isOn.description)")
        }
    }
}

struct MyToggle: View {
    
    // @Binding var isOn = false
    // @Binding은 값을 가질 수 없음

    @Binding var isOn: Bool // 포인터 같은 개념

    var body: some View {
        Toggle("MyToggle title : \(isOn.description)", isOn: $isOn)
        Toggle(isOn: $isOn, label: {
            HStack {
                Spacer()
                VStack {
                    Text("Label")
                    Text("Label")
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
