//
//  ContentView.swift
//  Calculator
//
//  Created by Leo on 2023/09/03.
//

import SwiftUI

struct CalcButton: View {

    var buttonName = ""
    
    var body: some View {
        Circle()
            .foregroundColor(.orange)
            .overlay { // ZStack 보다 이게 어울림
                Text(buttonName)
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
    }
}

struct ContentView: View {
    
    @State private var geoCircleHeight: CGFloat = 50
    @State private var display: String = "0"
    @State private var isInTheTypingOfDigit = false
    
    var core = CalcLogic()
    
    let data = [
        ["AC", "+-", "%", "+"],
        ["7", "8", "9", "x"],
        ["8", "5", "6", "-"],
        ["9", "2", "3", "+"],
        ["0", ".", "="],
    ]
    
    var body: some View {
        VStack {
            
            Text(display)
                .font(.largeTitle)
                .padding(.trailing, 10) // 패딩을 잡고 width를 잡아야됨
                .frame(width: UIScreen.main.bounds.size.width, alignment: .trailing) // 프레임 내부에서 align 설정

            
            ForEach(0..<4, id: \.self) { indexI in
                HStack(spacing: 10){
                    ForEach(0..<4, id: \.self) { indexJ in
                        Button {
                            calcAction(symbol: data[indexI][indexJ])
                        } label: {
                            CalcButton(buttonName: data[indexI][indexJ])
                                .aspectRatio(1, contentMode: .fit)
                        }
                        
                        /*
                         CalcButton(...)
                         .tapGesture // 형태도 가능
                         */

                    }
                }
                .padding(.horizontal, 10)
            }
            
            // last line
            HStack(spacing: 10) {
                GeometryReader { geometry in
                    Capsule() // width 2, height 1
                        .aspectRatio(
                            CGSize(
                                width: geometry.size.height * 2 + 10,
                                height: geometry.size.height
                            ), contentMode: .fit)
                        .foregroundColor(.orange)
                        .overlay {
                            Text(data[4][0])
                                .font(.largeTitle)
                                
                        }
                        .onAppear {
                            self.geoCircleHeight = geometry.size.height
                            // onAppear에서 안하면 그려질때마다 불려서 안됨
                        }
                        .onTapGesture(count: 1) {
                            calcAction(symbol: data[4][0])
                        }

                }
                CalcButton(buttonName: data[4][1])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(count: 1) {
                        calcAction(symbol: data[4][1])
                    }
                     
                CalcButton(buttonName: data[4][2])
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture(count: 1) {
                        calcAction(symbol: data[4][2])
                    }
            }
            .aspectRatio(CGSize(width: geoCircleHeight * 4 + 30, height: geoCircleHeight), contentMode: .fit) // 가로:세로 4:1
            .padding(.horizontal, 10)

        }
    }
    
    func calcAction(symbol: String) {
        if Int(symbol) != nil {
            if isInTheTypingOfDigit { // 숫자를 쓰고 있는상태
                display = display + symbol
            } else {
                isInTheTypingOfDigit = true
                display = symbol
            }
            
            if core.rememberSymbol == nil {
                core.digit1 = Double(display)
            } else {
                core.digit2 = Double(display)
            }
        } else {
            if symbol != "=" {
                core.rememberSymbol = symbol
            }
            
            isInTheTypingOfDigit = false
            
            if symbol == "AC" {
                core.digit1 = nil
                core.digit2 = nil
                core.calculateResult = nil
                core.rememberSymbol = nil
                display = "0"
            }
            
            if symbol == "%" {
                display = "\(String(describing: core.logic()!))"
                core.digit1 = Double(display)
            }
            
            if symbol == "=" {
                display = "\(String(describing: core.logic()!))"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
