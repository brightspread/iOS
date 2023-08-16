//
//  ContentView.swift
//  Lecture19_20_Toggle
//
//  Created by Leo on 2023/08/16.
//

import SwiftUI

// Custom Toggle

struct CustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        // Design
        RoundedRectangle(cornerRadius: 100)
            .foregroundColor(configuration.isOn ? .red : .blue)
            .overlay(
                GeometryReader(content: { geomtry in // 현재 구성하는 뷰에서 위치같은걸 알 수 있음
                    ZStack {
                        Circle()
                            .foregroundColor(.orange)
                            .frame(width: geomtry.frame(in: .local).height)
                        Text(configuration.isOn ? "On" : "Off")
                    }
                    .offset(
                        x:configuration.isOn ?
                        geomtry.frame(in: .local).minX :
                            geomtry.frame(in: .local).maxX - geomtry.frame(in: .local).height
                    )
                    .shadow(radius: 10)
                })
            )
            .clipShape(Capsule()) // 그림자 바깥쪽 자르기
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.25)) {
                    configuration.isOn.toggle()
                }
            }
    }
}

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        Toggle("\(isOn.description)", isOn: $isOn)
            .toggleStyle(CustomToggle())
            .frame(width: 200, height: 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
