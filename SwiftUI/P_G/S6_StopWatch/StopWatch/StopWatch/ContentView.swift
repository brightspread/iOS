//
//  ContentView.swift
//  StopWatch
//
//  Created by Leo on 2023/09/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var time: Double = 0
    
    var humanReadableTime: String {
        let sec = Int(time) % 60
        let min = Int(time) / 60
        let milliSec = time.truncatingRemainder(dividingBy: 1)
        let milliString = String(format: "%.2f", milliSec).split(separator: ".")
            .last ?? "0"
        return "\(String(format:"%02d", min))" + ":" + "\(String(format:"%02d", sec))" + ":" + "\(milliString)"
    }
    
    @State private var isStart = false
    
    var timer = Timer.publish(
        every: 0.01/* 0.1초 주기 */,
        on: .current,
        in: .default
    ).autoconnect() // 객체 날아가면 같이 날아가는것
    
    var body: some View {
        VStack {
            ZStack {
                CenterCircle()
                ClockBackground()
                ClockNumber()
                
                SecondHand(sec: time)
                MinuteHand(sec: time)
                
                CenterCircle()
                    .offset(y: 50)
                MilliClockBackground()
                    .offset(y: 50)
                HundredMilliSecHand(sec: time)
                    .offset(y: 50)
            }
            .padding(.bottom, 150)
            
            StartStopButton(isStart: $isStart)
            Text(humanReadableTime)
                .frame(width: 150,
                       alignment: .leading)
                .font(.largeTitle)
        }
        .onReceive(timer) { _ in
            withAnimation {
                if isStart {
                    self.time += 0.01
                }
            }
        }
    }
}

struct StartStopButton: View {
    
    @Binding var isStart: Bool
    
    var body: some View {
        HStack(spacing: 0.5) {
            Button {
                isStart = true
            } label: {
                Text("Start")
                    .frame(
                        width: UIScreen.main.bounds.size.width / 2,
                        height: 50
                    )
                    .background(.orange)
            }
            
            Button {
                isStart = false
            } label: {
                Text("Stop")
                    .frame(
                        width: UIScreen.main.bounds.size.width / 2,
                        height: 50
                    )
                    .background(.orange.opacity(0.5))
            }
        }
        /*
         HStack(spacing: 0.5) {
         Button("Start") {
         isStart = true
         }
         .frame(
         width: UIScreen.main.bounds.size.width / 2,
         height: 50
         )
         .background(.orange)
         Button("Stop") {
         isStart = false
         }
         .frame(
         width: UIScreen.main.bounds.size.width / 2,
         height: 50
         )
         .background(.orange.opacity(0.5))
         } // 이렇게 하면 배경 눌렀을 때 동작 안함
         */
    }
}

struct ClockBackground: View {
    
    let tickCount = 60
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount, id: \.self) { tick in
                Rectangle()
                    .fill(.red)
                    .frame(width: 1, height: tick % 5 == 0 ? 20 : 10)
                    .offset(y: 100)
                    .rotationEffect(.degrees(Double(tick * 360 / tickCount)))
                
            }
        }
    }
}

struct MilliClockBackground: View {
    
    let tickCount = 10
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount, id: \.self) { tick in
                Rectangle()
                    .fill(.red)
                    .frame(width: 1, height: 10)
                    .offset(y: 30)
                    .rotationEffect(.degrees(Double(tick * 360 / tickCount)))
                
            }
        }
    }
}


struct ClockNumber: View {
    let tickCount = 60
    
    var body: some View {
        ZStack {
            ForEach(0..<tickCount, id: \.self) { tick in
                if tick % 5 == 0 {
                    ZStack {
                        Text("\(tick)")
                            .rotationEffect(.degrees(-Double(tick * 360 / tickCount)))
                        // 다시 회전시켜서 숫자는 회전시키지 않도록 함
                    }
                    .offset(y: -120)
                    .rotationEffect(.degrees(Double(tick * 360 / tickCount)))
                }
            }
        }
    }
}

struct SecondHand: View {
    private let height = 80.0
    
    var sec: Double
    
    var body: some View {
        Rectangle()
            .fill(.orange)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees(sec / 60 * 360))
    }
}

struct MinuteHand: View {
    private let height = 50.0
    
    var sec: Double
    
    var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees(sec / 60 / 60 * 360))
    }
}

struct HundredMilliSecHand: View {
    private let height = 25.0
    
    var sec: Double
    
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 3, height: height)
            .offset(y: -height / 2)
            .rotationEffect(.degrees(sec / 60 * 60 * 360))
    }
}

struct CenterCircle: View {
    let radius: CGFloat = 15
    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: radius, height: radius)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
